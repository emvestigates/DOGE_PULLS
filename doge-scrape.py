import io
import os
from datetime import datetime
from time import sleep

import pandas as pd
import requests as req
import validators
from bs4 import BeautifulSoup
from selenium.webdriver import Firefox
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from tqdm import tqdm

data_key_dict = { # match on the 'id' field
    'award_agency': 'agencyID',
    'award_procurement_id': 'PIID',
    'award_modification_num': 'modNumber',
    'ref_idv_agency': 'idvAgencyID',
    'ref_idv_procurement_id': 'idvPIID',
    'ref_idv_modification_num': 'idvModNumber',
    'date_signed': 'signedDate',
    'date_effective': 'effectiveDate',
    'date_complete': 'awardCompletionDate',
    'date_ult_complete_est': 'estimatedUltimateCompletionDate',
    'date_solicitation': 'solicitationDate',
    'amount_obligated': 'obligatedAmount',
    'amount_obligated_total': 'totalObligatedAmount',
    'amount_base_exercised_options': 'baseAndExercisedOptionsValue',
    'amount_base_exercised_options_total': 'totalBaseAndExercisedOptionsValue',
    'amount_ultimate': 'ultimateContractValue',
    'amount_ultimate_total': 'totalUltimateContractValue',
    'entity_id': 'UEINumber',
    'entity_name': 'vendorName',
    'entity_dba': 'vendorDoingAsBusinessName',
    'cage_code': 'cageCode',
    'entity_street': 'vendorStreet',
    'entity_street_2': 'vendorStreet2',
    'entity_city': 'vendorCity',
    'entity_state': 'vendorState',
    'entity_zip': 'vendorZip',
    'entity_county': 'vendorCountry',
    'entity_county_disp': 'vendorCountryForDisplay',
    'entity_phone': 'vendorPhone',
    'entity_fax': 'vendorFax',
    'entity_congressional_district': 'vendorCongressionalDistrict',
    'product_service_code': 'productOrServiceCode',
    'product_service_desc': 'productOrServiceCodeDescription',
    'principal_naics_code': 'principalNAICSCode',
    'principal_naics_desc': 'NAICSCodeDescription',
}

def safe_load_csv(filepath):
    df = pd.read_csv(filepath) if os.path.exists(filepath) else pd.DataFrame([])
    if 'uploaded_dt' in df.keys():
        df['uploaded_dt'] = pd.to_datetime(df['uploaded_dt'])
    return df

def load_pre_data():
    pre_contract_df = safe_load_csv('./data/doge-contract.csv')
    pre_grant_df = safe_load_csv('./data/doge-grant.csv')
    pre_property_df = safe_load_csv('./data/doge-property.csv')
    return pre_contract_df, pre_grant_df, pre_property_df

def configure_driver():
    op = Options()
    op.add_argument('-headless')
    return Firefox(options=op)


def import_doge(driver):
    contract_df = pd.read_csv('contracts_all.csv')
    grant_df = pd.read_csv('grants_all.csv')
    property_df = pd.read_csv('leases_all.csv')

    return contract_df, grant_df, property_df


def parse_fpds_html(fpds_soup):
    data_dict = {}
    for k, qk in data_key_dict.items():
        element = fpds_soup.find('input',id=qk)
        data_dict[k] = element.get('value',default=None) if element is not None else None
        if 'amount' in k and data_dict[k] is not None:
            data_dict[k] = float(str(data_dict[k]).replace('$','').replace(',',''))
    req_desc_element = fpds_soup.find('textarea',id='descriptionOfContractRequirement')
    data_dict['requirement_desc'] = None if req_desc_element is None else req_desc_element.get('text',default=None)
    return data_dict

def extend_contract_data(contract_df):
    data_dict_list = []
    rh = req.utils.default_headers()
    # this takes about 2s per iteration. Speedup without DOSing the FPDS server?
    for fpds_link in tqdm(contract_df.link.values):
        if validators.url(fpds_link):
            r = req.get(fpds_link,headers=rh)
            data_dict_list.append(parse_fpds_html(BeautifulSoup(r.content,features="lxml")))
        else:
            data_dict_list.append({k: None for k, _ in data_key_dict.items()})
    return pd.concat([contract_df_all.reset_index().drop('index',axis=1),pd.DataFrame(data_dict_list)],axis=1)

def save_doge_data(contract_df,grant_df,property_df):
    contract_df.to_csv(f'./data/doge-contract.csv',index=False)
    grant_df.to_csv(f'./data/doge-grant.csv',index=False)
    property_df.to_csv(f'./data/doge-property.csv',index=False)

def update_doge_data():
    datetime_scrape = datetime.strftime(datetime.now(),'%Y-%m-%d-%H%M')
    print('configuring headless chrome driver...')
    driver = configure_driver()
    print('loading current data...')
    pre_contract_df, pre_grant_df, pre_property_df = load_pre_data()
    print('processing data...')
    contract_df, grant_df, property_df = import_doge(driver)
    driver.quit()
    
    print('extending contract table with FPDS data...')
    contract_df = extend_contract_data(contract_df)
    
    contract_df = pd.concat([pre_contract_df,contract_df])
    grant_df = pd.concat([pre_grant_df,grant_df])
    property_ = pd.concat([pre_property_df,property_df])
    return contract_df, grant_df, property_df

def main():
    contract_df, grant_df, property_df = update_doge_data()
    save_doge_data(contract_df,grant_df,property_df)

if __name__ == '__main__':
    main()
