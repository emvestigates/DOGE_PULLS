### Weekly Scrape of doge.gov/savings 'Wall of Receipts' plus current Grant & Lease tables
<hr>
This repository utilizes a GitHub action partially based on the one <a href="https://github.com/m-nolan/doge-scrape"> published by m-nolan</a>, but with some slight modifications. Biggest difference: This action uses an R-based scraper that pulls from the DOGE API, and then utilizes the Python script by m-nolan to parse the FPDS information for the contracts data. The goal is to schedule the scraper to pull each Monday* barring any new changes to the doge.gov/savings framework. <br>
<p></p><b>Important Notes:</b></p>
<p style="padding-left: 40px;">    - References to findings in this data should be couched that they are "according to data pulled from the Department of Government Efficiency savings webpage" and any hard numbers should be verified using other government spending data (such as <a href="https://www.usaspending.gov/search">USA Spending</a>) or by contacting the contract recipients or departments directly.</p>
<p style="padding-left: 40px;">    - The {award_procurement_id} field <i>should</i> match the {award_id_piid} field in USA Spending data, but other fields should be used to confirm a match</p>
<p style="padding-left: 40px;">    - The {value} field in the data pulls is believed to refer to the {potential_total_value_of_award} field in USA Spending data, and refers to <i>"the total amount that could be obligated on a contract, if the base and all options are exercised"</i></p>


<br><i>*See the {dt_scrape} field of each CSV file for the precise date.</i>
