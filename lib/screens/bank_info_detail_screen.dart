import 'package:flutter/material.dart';

class BankInfoDetailScreen extends StatelessWidget {
  final String bankName;
  final String title;

  const BankInfoDetailScreen({
    super.key,
    required this.bankName,
    required this.title,
  });

  String getContent() {
    // Logic for State Bank of India
    if (bankName == "State Bank of India") {

      switch (title) {

        case "Basic Information":
          return """
State Bank of India is India’s largest public sector bank and a statutory body for banking and financial services, headquartered in Mumbai. It serves over 500 million customers through more than 22,500 branches and a large global presence.

It has a legacy of over 200 years and was formed in its present structure in 1955 when the Imperial Bank of India was nationalised and renamed as State Bank of India.

SBI plays a key role in India’s financial system with a large share of total banking assets, loans and deposits.

The bank provides a wide range of services including:
• Personal banking
• Rural and agricultural banking
• SME and corporate banking
• International banking
• Government banking services
• Digital banking through YONO and Internet Banking

SBI also operates subsidiaries like:
• SBI Life Insurance
• SBI General Insurance
• SBI Mutual Fund
• SBI Card

Key Information:
• Public sector bank with majority government ownership.
• Head office located in Mumbai.
• Massive branch and ATM network across India.
• Provides loans, deposits, insurance, mutual funds and wealth management services.
• Supports financial inclusion and government welfare schemes.

About Banking:
Banks like State Bank of India help people save money, borrow funds, make digital payments and perform secure financial transactions.

Example Services:
• Savings and current accounts
• Home loans, car loans and education loans
• Corporate and SME finance
• Insurance and investment products
""";

        case "Interest Rates":
          return """
Interest rates at State Bank of India determine the return customers receive on deposits and the cost of borrowing money.

Savings Account Interest
• Around 2.5% per annum (subject to change).
• Calculated daily on account balance.
• Credited quarterly to the account.

Fixed Deposit (FD)
• Tenure ranges from 7 days to 10 years.
• Interest typically ranges from about 3.05% to 6.4%.
• Senior citizens receive additional interest benefits.
• Special FD schemes may offer slightly higher rates.

Loan Interest
• Home loan interest is based on RBI external benchmark rates.
• Education loans vary depending on course and institution.
• Personal loans depend on credit score and repayment capacity.

Tip:
Always check the latest SBI interest rate chart before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
State Bank of India offers many schemes designed for different customers such as salaried employees, students, farmers and businesses.

Home Loan Schemes
• Regular Home Loan
• Flexipay Home Loan
• Shaurya Home Loan (for defence personnel)
• Privilege Home Loan (for government employees)
• NRI Home Loan
• Maxgain overdraft home loan

Education Loan Schemes
• SBI Student Loan Scheme
• SBI Scholar Loan
• SBI Skill Loan
• SBI Global Ed-Vantage Loan

Personal Loan Schemes
• Xpress Credit
• Pension Loan
• Pre-approved YONO personal loans

Government Schemes
• PM Jan Dhan Yojana (Zero balance accounts)
• PM Mudra Yojana (for small businesses)
• MSME support schemes
• Agriculture and rural development loans

These schemes support housing, education, entrepreneurship and financial inclusion across India.
""";

        case "Account Types":
          return """
State Bank of India offers different types of accounts for individuals, businesses and NRIs.

Savings Accounts
• Regular Savings Account
• Basic Savings Bank Deposit Account (Zero balance)
• Savings Plus account with auto-sweep FD
• Minor accounts for children
• Digital Insta savings accounts via Video-KYC

Current Accounts
• Designed for businesses and professionals
• High transaction limits
• Cheque facilities and overdraft options

Salary and Pension Accounts
• Salary accounts for corporate and government employees
• Pension accounts for retired customers
• Special benefits such as zero minimum balance

NRI Accounts
• NRE Account
• NRO Account
• FCNR Foreign Currency Accounts

Fixed Deposits
• Tenure from 7 days to 10 years
• Tax-saving FD with 5-year lock-in
• Special FD schemes launched periodically
""";

        case "Fees & Charges":
          return """
State Bank of India applies service charges depending on account type, card variant and services used.

Debit Card Charges
• Annual fees depend on card type such as RuPay, Classic or Platinum.
• Basic financial inclusion accounts may have low or zero fees.

ATM Charges
• Limited free ATM transactions allowed each month.
• Additional transactions may incur small charges.

Minimum Balance
• Many accounts like Jan Dhan and BSBDA have zero minimum balance.
• Other accounts may require a minimum average balance.

Loan Processing Fees
• Home loans usually charge around 0.35% processing fee.
• Personal loans may charge up to about 1.5%.

Other Service Charges
• SMS alerts
• Additional cheque books
• Stop-payment requests
• Account statements and certificates

Note:
All charges may change periodically. Always check the latest SBI service charges list before using any banking service.
""";
      }
    }


    // Logic for Punjab National Bank (Now correctly inside the function)
    if (bankName == "Punjab National Bank") {

      switch (title) {

        case "Basic Information":
          return """
Punjab National Bank is one of India’s major public sector banks and is widely known as the country’s first Swadeshi bank.
It was founded in 1894 and started operations in 1895 from Lahore with Indian capital and management.

Today, Punjab National Bank is among the largest public sector banks in India with a network of more than 10,000 branches and thousands of ATMs and banking outlets across the country.
The bank serves individuals, businesses, government departments and institutions through retail banking, corporate banking, treasury operations and rural/agriculture banking.

Key Information:
• Public sector bank with majority ownership by the Government of India.
• Headquartered in New Delhi with a large branch and ATM network across India and international presence.
• Offers services in retail banking, MSME banking, corporate banking, rural banking and international banking.
• Provides deposits, loans, credit cards, insurance and investment services for different customer segments.
• Plays a key role in implementing government schemes and financial inclusion programs.

About Banking:
Banks like Punjab National Bank accept deposits, lend money, enable digital payments and provide safe financial transaction services.

Example Services:
• Savings and current accounts for individuals and businesses.
• Home loans, vehicle loans, personal loans and education loans.
• Working capital and trade finance for businesses.
• Investment and insurance services through partnerships.
""";

        case "Interest Rates":
          return """
Interest rates at Punjab National Bank determine how much customers earn on deposits and how much they pay on loans. Rates may change from time to time based on RBI policies and bank decisions.

Savings Interest:
• Savings accounts generally earn about 2.5% per annum on balances up to a specified threshold.
• Interest is calculated on the daily balance and credited quarterly.

Fixed Deposit Interest:
• Fixed deposits are available for tenures from 7 days to 10 years.
• Interest rates generally range from about 3% per annum for short-term deposits to around 6.6% per annum for select tenures.
• Senior citizens usually receive additional interest over regular rates.
• Special schemes such as tax-saving fixed deposits may have different rates and conditions.

Loan Interest:
• Home loan rates are linked to external benchmark rates and vary depending on borrower profile and credit score.
• Typical home loan rates start from the high 8% range for eligible borrowers.
• Education loans and personal loans have separate interest structures based on scheme and customer risk profile.

Tip:
Customers should always check the latest interest rate chart on the official PNB website or at a branch before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
Punjab National Bank offers multiple schemes designed for housing, education, personal finance and business growth.

Home Loan Schemes:
• PNB Gen-Next Home Loan, PNB Flexi Home Loan, Women’s Home Loan and Defence Personnel Home Loan.
• Loans available for purchase, construction or renovation of residential property.
• Repayment tenure may extend up to around 30 years.

Education Loan Schemes:
• PNB Saraswati, PNB Udaan and PNB Pratibha education loan schemes.
• Loans available for higher education in India and abroad.
• Repayment usually starts after completion of the course with a moratorium period.

Personal Loan Schemes:
• Personal loans for salaried employees and self-employed individuals.
• Special loan schemes for pensioners and defence personnel.
• Pre-approved digital personal loans available for eligible customers.

Government Schemes:
• Participation in schemes such as PM Jan Dhan Yojana for financial inclusion.
• Mudra loans for small entrepreneurs.
• MSME support schemes such as Stand-Up India and CGTMSE-backed loans.

These schemes help individuals, students, entrepreneurs and businesses access financial support.
""";

        case "Account Types":
          return """
Punjab National Bank offers various account types designed for individuals, businesses and NRIs.

Savings Accounts:
• Regular savings accounts with ATM/debit cards and digital banking facilities.
• Premium savings accounts with additional benefits and higher transaction limits.
• Salary accounts for employees with zero or low minimum balance requirements.
• Special accounts such as Rakshak accounts for defence personnel and student accounts.

Current Accounts:
• Current accounts for traders, firms and companies with frequent transactions.
• Provide cheque facilities, higher transaction limits and overdraft options.

Salary and Pension Accounts:
• Salary accounts for employees through employer tie-ups.
• Pension accounts for retired government employees and other pensioners.

NRI Accounts:
• NRE and NRO accounts for Non-Resident Indians.
• FCNR deposits for foreign currency investments.

Fixed Deposit and Recurring Deposits:
• Fixed deposits with tenures from 7 days to 10 years.
• Recurring deposits for monthly savings.
• Tax-saving fixed deposits with a 5-year lock-in period.
""";

        case "Fees & Charges":
          return """
Punjab National Bank applies service charges depending on account type and banking services used.

Debit Card Charges:
• Annual maintenance fees vary depending on debit card type.
• Basic savings and salary accounts may have reduced or zero card charges.

ATM Charges:
• A limited number of ATM transactions per month are free.
• Additional transactions beyond the free limit may attract charges.

Minimum Balance Charges:
• Some accounts require maintaining a minimum balance.
• Failure to maintain the required balance may result in penalty charges.

Loan Processing Fees:
• Loans such as home loans and personal loans may include processing fees based on the sanctioned amount.
• Additional charges such as documentation or valuation fees may apply.

Other Service Charges:
• SMS alerts and account statements
• Cheque book issuance beyond free limits
• Stop payment instructions
• Other branch services as per bank policy

Note:
Customers should check the latest Schedule of Charges on the official Punjab National Bank website or contact the nearest branch for updated information.
""";
      }
    }

    if (bankName == "Bank of Baroda") {

      switch (title) {

        case "Basic Information":
          return """
Bank of Baroda (BoB) is one of India’s leading public sector banks, majority-owned by the Government of India and headquartered in Vadodara, Gujarat, with a corporate office in Mumbai.

Established on 20 July 1908 by Maharaja Sayajirao Gaekwad III, Bank of Baroda has grown from a regional bank into a large national and international institution.
It was nationalised in 1969 along with other major Indian banks and today ranks among the largest public sector banks in India in terms of assets, business size and branch network.

Domestic & International Presence:
• Extensive branch and ATM network across urban, semi-urban and rural areas in India.
• International branches and subsidiaries serving NRIs and global customers in multiple countries.
• Strong focus on retail, corporate, MSME, agriculture and government business segments.

Digital Banking:
• bob World mobile app providing 190+ banking services such as balance enquiry, UPI transfers, bill payments and card management.
• bob World Internet banking platform offering account view, FD/RD creation, loan servicing and cheque-book requests.
• Core Banking System supporting real-time banking services across branches.

Role in the Economy:
• Mobilises savings through deposits and channels them into loans for individuals, businesses, agriculture and infrastructure.
• Implements Government of India schemes such as Mudra loans and Jan Dhan Yojana.
• Provides banking services in both metropolitan cities and rural regions.

About Banking in General:
Banks like Bank of Baroda play a key role in holding deposits safely, lending money to eligible borrowers and enabling digital payments through modern banking systems.
""";

        case "Interest Rates":
          return """
Interest rates determine the return customers earn on deposits and the cost of borrowing loans. Bank of Baroda updates rates periodically based on RBI policy and market conditions.

Savings Interest:
• Savings account interest is slab-based depending on the balance maintained.
• Rates generally range from around 2.50% p.a. to about 4.75% p.a. for higher balances.
• Interest is calculated on the daily balance and credited periodically.

Fixed Deposit (FD):
• Fixed deposits offer higher interest rates than savings accounts.
• Rates usually range between about 3.50% p.a. and roughly 6.60% p.a., depending on tenure.
• Senior citizens typically receive additional interest benefits.

Loan Interest:

Home Loans
• Linked to the Bank of Baroda benchmark lending rate (BRLLR).
• Floating home loan rates typically start from around 7–8% p.a., depending on credit score and loan scheme.

Education Loans
• Loans such as Baroda Vidya, Baroda Gyan and Baroda Scholar generally fall within roughly 7%–12% p.a. depending on course and collateral.

Personal Loans
• Personal loan rates may start from about 10% p.a. depending on the borrower’s credit profile.

Tip:
Always verify the latest interest rates on the official Bank of Baroda website before investing or borrowing.
""";

        case "Schemes":
          return """
Bank of Baroda offers a wide variety of schemes for housing, education, personal finance and entrepreneurship.

Home Loan Schemes:
• Baroda Home Loan for purchasing or constructing houses.
• Baroda Max Savings Home Loan with overdraft-linked structure.
• Home improvement and top-up loans for renovation or expansion.

Education Loan Schemes:
• Baroda Vidya – school education loans.
• Baroda Gyan – higher education loans in India.
• Baroda Scholar – education loans for studying abroad.
• Special schemes for students admitted to premier institutions.

Personal and Retail Loans:
• Personal loans for salaried individuals and other eligible customers.
• Vehicle loans, gold loans and loan against property.

Government Schemes:

Pradhan Mantri Mudra Yojana (PMMY)
• Collateral-free loans up to ₹10 lakh for small businesses.
• Categories include Shishu, Kishore and Tarun based on business stage.

Pradhan Mantri Jan Dhan Yojana (PMJDY)
• Zero-balance accounts with RuPay debit card and insurance benefits.
• Used for Direct Benefit Transfer (DBT) of government subsidies.

These schemes help promote home ownership, higher education, entrepreneurship and financial inclusion.
""";

        case "Account Types":
          return """
Bank of Baroda offers multiple account types for individuals, businesses and NRIs.

Savings Accounts:
• Designed for individuals to deposit money while earning interest.
• Variants include Super Savings, Baroda Advantage Savings, minor accounts, senior citizen accounts and professional accounts.
• Features include debit card, passbook, cheque book, internet banking and mobile banking through bob World.

Current Accounts:
• Designed for businesses, firms and institutions with high transaction volumes.
• Provide facilities like unlimited transactions, cheque payments and overdraft facilities.

Salary Accounts:
• bob Salary Classic and bob Super Salary accounts offered through employer partnerships.
• Features include zero balance requirement, loan concessions and insurance benefits.

NRI Accounts:
• NRE, NRO and FCNR accounts for Non-Resident Indians to manage foreign and Indian income.
• Provide remittance facilities and digital banking access.

Fixed Deposits:
• Term deposits offering higher interest than savings accounts.
• Includes tax-saving FDs and special schemes like BOB Square Drive deposits.
""";

        case "Fees & Charges":
          return """
Bank of Baroda charges certain service fees depending on account type and banking services used.

Debit Card Charges:
• Debit cards such as RuPay, Visa and MasterCard may have issuance and annual maintenance fees.
• Annual fees for standard cards are typically around ₹100–₹300 plus taxes depending on card type.

ATM Charges:
• A fixed number of ATM transactions each month are free.
• Transactions beyond the free limit may attract charges such as about ₹21 per withdrawal and ₹11 for balance enquiry at other bank ATMs.

Minimum Balance Charges:
• Some savings accounts require a minimum balance, while basic accounts may allow zero balance.
• Non-maintenance charges may apply depending on account type.

Loan Processing Fees:
• Loans such as home loans and personal loans usually charge a processing fee calculated as a percentage of the loan amount.

Other Service Charges:
• Duplicate statements
• Cheque books beyond free leaves
• Demand draft issuance
• Signature verification and other banking services.

Note:
Charges and policies change periodically. Customers should always check the latest service-charges schedule on the official Bank of Baroda website or at their branch.
""";

      }

    }

    if (bankName == "Canara Bank") {

      switch (title) {

        case "Basic Information":
          return """
Canara Bank is one of India’s leading public sector banks, headquartered in Bengaluru and counted among the largest nationalised banks in the country.
It was founded in 1906 in Mangalore by Ammembal Subba Rao Pai and was nationalised in 1969, after which it expanded rapidly across India.
Following its merger with Syndicate Bank, Canara Bank became one of the largest public sector banks by business volume with a very wide branch and ATM network.

Key Information:
• Public sector bank under Government of India ownership, focused on retail, corporate, MSME, agriculture and priority sector lending.
• Head office in Bengaluru with thousands of branches and ATMs across India and overseas offices in cities like London, Dubai and New York.
• Offers a full range of financial services including deposits, loans, credit cards, insurance distribution, mutual funds, NRI banking and remittances.
• Strong focus on digital banking through internet banking, mobile banking apps and card-based services.
• Actively supports government initiatives and financial inclusion programmes such as PMJDY and Mudra loans.

About Banking:
Banks like Canara Bank accept deposits from customers, provide loans to individuals and businesses, enable digital payments and help support economic growth by channelising savings into productive sectors.
""";

        case "Interest Rates":
          return """
Interest rates define how much return customers earn on deposits and how much they pay on loans. Canara Bank revises these rates periodically based on market conditions and RBI guidelines.

Savings Interest:
• Savings account interest generally ranges from about 2.55% – 4.00% p.a. depending on the balance maintained.
• Interest is calculated on the daily closing balance and credited periodically.

Fixed Deposit Interest:
• Fixed deposits typically offer higher interest than savings accounts.
• Indicative FD rates for regular customers range roughly from 3.00% to 6.50% p.a. depending on tenure.
• Senior citizens usually receive additional interest (around 0.5% higher).

Loan Interest:
• Most loans are linked to the Repo Linked Lending Rate (RLLR).
• Home loan interest rates generally range from around 8.00% to about 10.75% depending on the borrower profile and scheme.
• Education loans and other retail loans have different rate slabs based on course, credit score and collateral.

Tip:
Always check the latest interest rates on Canara Bank’s official website or branch before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
Canara Bank offers multiple schemes to support housing, education, personal needs and business development.

Home Loan Schemes:
• Canara Kuteer and other housing loans for purchase, construction or renovation of homes.
• Housing loans for agriculturists and NRI customers.
• Housing-cum-solar loan schemes for installing solar equipment.
• Top-up loans and home improvement loans available.

Education Loan Schemes:
• Vidya Turant and Vidya Sagar education loan schemes.
• IBA Model Education Loan for studies in India and abroad.
• Loans for skill development and professional courses.
• Repayment periods can extend up to around 10–15 years with moratorium during the course period.

Personal and Retail Schemes:
• Canara Ready Cash and Canara My Money personal loan schemes.
• Loans for medical needs, travel, weddings and consumer purchases.
• Loans against mutual funds or other financial assets.

Government Schemes:
• Implements schemes like Pradhan Mantri Jan Dhan Yojana (PMJDY).
• Mudra loans for micro enterprises.
• PM SVANidhi for street vendors.
• Agriculture and MSME support programmes.

These schemes help individuals, entrepreneurs, students and farmers access financial resources and achieve their financial goals.
""";

        case "Account Types":
          return """
Canara Bank provides multiple account types for individuals, businesses and NRIs.

Savings Accounts:
• Regular savings accounts for individuals.
• Special variants like Junior Savings, Senior Citizen accounts and SB Power Plus accounts.
• Digital facilities include debit cards, net banking, mobile banking and UPI.

Current Accounts:
• Designed for businesses and professionals with frequent transactions.
• Provide cheque book facilities, overdraft options and higher transaction limits.

Salary Accounts:
• Payroll accounts for employees of corporates and institutions.
• Often include zero balance requirement, free ATM transactions and loan concessions.

NRI Accounts:
• NRE, NRO and FCNR(B) accounts for Non-Resident Indians.
• Allow management of foreign and Indian income with repatriation benefits subject to RBI rules.

Fixed Deposits:
• Term deposits ranging from 7 days to 10 years.
• Includes tax-saving deposits, recurring deposits and NRI deposit options.
""";

        case "Fees & Charges":
          return """
Canara Bank charges certain service fees depending on account type, card variant and services used.

Debit Card Charges:
• Different debit cards such as Classic, Platinum and Select have different annual fees.
• For example, a standard debit card may cost around ₹200 annually, while premium cards may have higher fees.

ATM Charges:
• Customers receive a limited number of free ATM transactions per month.
• Additional transactions may cost around ₹20 for financial transactions and ₹10 for non-financial transactions.

Minimum Balance Charges:
• Some account types require minimum balance maintenance depending on branch location.
• Many basic or zero-balance accounts are available to avoid balance penalties.

Loan Charges:
• Loans may include processing fees, legal and valuation charges depending on the loan product.

Other Charges:
• SMS alerts
• Cheque books beyond free leaves
• Stop-payment requests
• Duplicate statements and other service requests.

Note:
All fees and interest rates may change periodically. Customers should always check the latest service-charge schedule on the official Canara Bank website or at their branch.
""";

      }

    }

    if (bankName == "Bank of Maharashtra") {

      switch (title) {

        case "Basic Information":
          return """
Bank of Maharashtra is one of the leading public sector banks in India, headquartered in Pune, with a strong presence across Maharashtra and other states.

Key Information:

• Established on 16 September 1935 in Pune to support small businesses, traders and self-employed individuals.  
• Nationalised in July 1969 and now majority owned by the Government of India.  
• Operates more than 2,600 branches across India with strong coverage in Maharashtra and a growing pan-India footprint.  
• Offers a full suite of retail, corporate and MSME banking services, along with digital banking via mobile apps, internet banking and UPI.  
• Plays an active role in financial inclusion through regional rural branches and participation in schemes like PM Jan Dhan Yojana and MUDRA.

About Banking:

Banks like Bank of Maharashtra mobilise deposits from customers and lend money to individuals, businesses and priority sectors such as agriculture and MSMEs, helping support economic growth.  
They also facilitate secure payments, fund transfers, remittances and digital transactions.

Example Services:

• Savings and salary accounts (including Basic Savings Bank Deposit Account and Mahabank Salary Account)  
• Current accounts for firms, traders and companies  
• Fixed deposits and recurring deposits for higher returns on savings  
• Home loans, education loans, vehicle loans and personal loans  
• MSME and business loans, working capital limits and project finance  
• Investment and insurance products distributed through branches and digital channels
""";

        case "Interest Rates":
          return """
Interest rates at Bank of Maharashtra define how much return customers earn on deposits and how much they pay on loans.  
Rates change from time to time, so customers should always check the latest figures on the bank’s official website or at a branch.

Savings Interest:

• Bank of Maharashtra pays interest on savings accounts using balance slabs.  
• For most retail balances, the savings interest rate is typically around 2.5% per annum.  
• Interest is generally calculated on the daily closing balance and credited quarterly.

Fixed Deposit (FD):

• Fixed deposits provide higher interest than savings accounts.  
• Short-term FDs (7–45 days) earn lower rates, while 1–3 year deposits can offer peak rates around 6%–7% p.a. for regular customers.  
• Senior citizens generally receive about 0.5% additional interest.  
• Special FD schemes and tax-saving 5-year deposits may offer slightly different rates.

Loan Interest:

• Home loans, education loans, vehicle loans and MSME loans each have separate interest structures.  
• Home loan rates may start around the low-7% p.a. range depending on credit score and borrower profile.  
• Personal loans and unsecured loans usually carry higher rates than secured loans.

Tip:

Always compare the latest interest rates on the official Bank of Maharashtra website before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
Bank of Maharashtra offers several schemes for home buyers, students, salaried customers, entrepreneurs and MSMEs.

Home Loan Schemes
• Loans for purchase or construction of houses, renovation and extension.  
• Flexible repayment tenures up to around 30 years.  
• Top-up loans available on existing home loans.

Education Loan Schemes
• Loans for higher education in India and abroad.  
• Covers tuition fees, hostel charges and other academic expenses.  
• Moratorium during study period with repayment starting after course completion.

Personal Loan Schemes
• Unsecured personal loans for salaried individuals and eligible customers.  
• Fast processing and flexible repayment options.

MSME and Business Schemes
• Pradhan Mantri MUDRA Yojana loans for micro enterprises (Shishu, Kishore and Tarun).  
• Maha MSME Project Loan Scheme for new or expanding businesses.  
• Working capital limits such as cash credit and overdraft facilities.

Government Schemes
• PM Jan Dhan Yojana for zero-balance accounts.  
• Mudra loan scheme for small entrepreneurs.  
• Various MSME and agriculture support programs.

These schemes support financial inclusion, entrepreneurship and economic growth.
""";

        case "Account Types":
          return """
Bank of Maharashtra provides different account types for individuals, salaried employees, businesses and NRIs.

Savings Accounts

• Basic Savings Bank Deposit Account (BSBDA) – zero-balance account for financial inclusion customers with debit card facility.  
• Regular Savings Account – standard savings account with minimum balance requirements and digital banking access.  
• Mahabank Salary Account – designed for salaried employees, usually zero balance with RuPay Platinum debit card and insurance benefits.  
• Specialised accounts for youth, women, senior citizens and pensioners.

Current Accounts

• Designed for businesses, firms and professionals with frequent transactions.  
• Multiple variants such as Bronze, Silver, Gold, Platinum and Diamond current accounts with different balance requirements.

NRI Accounts

• NRE and NRO accounts for Non-Resident Indians as per RBI guidelines.  
• NRE accounts hold overseas earnings while NRO accounts manage income earned in India.

Fixed Deposit Accounts

• Term deposits from 7 days to 10 years offering higher interest rates.  
• Options for cumulative or non-cumulative interest payouts.  
• Tax-saving FDs with a 5-year lock-in under Section 80C.  
• Special theme deposits may also be available.
""";

        case "Fees & Charges":
          return """
Bank of Maharashtra applies service charges depending on account type, product features and banking services used.

Debit Card Fee

• Many savings and salary accounts offer free debit card issuance.  
• Some card variants may have annual maintenance fees depending on the card type.

ATM Charges

• A limited number of ATM transactions each month are free as per RBI rules.  
• Additional transactions beyond the free limit attract standard charges.

Minimum Balance Penalty

• Regular savings and current accounts require a minimum balance depending on branch category.  
• Non-maintenance may attract graded penalty charges.

Loan Processing Charges

• Loans such as home, vehicle and personal loans may include processing fees.  
• Additional charges can include legal, documentation or valuation fees.

Other Charges

• SMS alerts  
• Demand drafts and pay orders  
• Additional statements and cheque books  
• Late payment or cheque bounce charges

Note:

Fees and policies may change periodically. Customers should always check the latest schedule of charges on the Bank of Maharashtra website or at their branch.
""";

      }

    }

    if (bankName == "IDBI Bank") {

      switch (title) {

        case "Basic Information":
          return """
IDBI Bank Limited (IDBI Bank) is a full-service commercial bank in India with a strong legacy in industrial and infrastructure financing.

Key Information:

• Originated in 1964 as the Industrial Development Bank of India, a development financial institution set up by the Government of India to support industrial growth.  
• Converted into a banking company in 2004 and renamed IDBI Bank Limited in 2008, expanding into universal banking with retail and corporate services.  
• Majority-owned by Life Insurance Corporation of India (LIC) and the Government of India, combining public-sector heritage with modern banking practices.  
• Operates more than 2,000 branches and over 3,500 ATMs across India, providing wide accessibility to customers.  
• Serves individuals, MSMEs, corporates, agriculture and institutional clients with a broad range of financial products.  
• Provides services such as deposits, loans, credit cards, digital banking, trade finance and treasury operations.  
• Offers modern digital banking services through internet banking, the Go Mobile+ app, UPI and other online payment systems.

About Banking:

Banks like IDBI Bank help customers safely deposit money, access credit for personal or business needs, and perform digital payments and fund transfers.  
They also support economic development by channelising savings into productive sectors like infrastructure, industries and MSMEs.

Example Services:

• Savings and salary accounts with debit cards and digital banking access  
• Current accounts and cash-management solutions for businesses  
• Fixed deposits, recurring deposits and tax-saving deposit schemes  
• Home loans, education loans, personal loans and auto loans  
• MSME and corporate financing including project and working-capital loans  
• NRI banking services including NRE/NRO accounts and foreign currency deposits
""";

        case "Interest Rates":
          return """
Interest rates at IDBI Bank determine how much customers earn on deposits and how much they pay on loans.  
These rates are periodically revised according to RBI policies and market conditions.

Savings Interest:

• IDBI Bank offers slab-based interest on savings accounts depending on the balance maintained.  
• Typical savings interest for retail customers usually ranges between about 2.5% – 3.5% per annum.  
• Interest is calculated on the daily closing balance and credited quarterly.

Fixed Deposit (FD):

• Fixed deposits are available for tenures ranging from 7 days up to 10–20 years.  
• Interest rates for regular customers generally range between about 3.0% – 6.5% per annum depending on the tenure.  
• Senior citizens usually receive an additional interest of around 0.50% per annum.  
• IDBI Bank also offers tax-saving FDs and special deposit schemes.

NRI Deposits:

• NRE and NRO term deposits are available for Non-Resident Indians.  
• Foreign currency deposits such as FCNR accounts allow customers to hold deposits in foreign currency.

Loan Interest:

• Home loan interest rates are generally linked to external benchmarks and may fall in the approximate range of 7% – 12% per annum depending on borrower profile.  
• Education loans, auto loans and personal loans each have different interest structures.  
• Unsecured personal loans usually have higher rates compared to secured loans.

Tip:

Always verify the latest interest rates on the official IDBI Bank website or at a branch before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
IDBI Bank offers several schemes designed for individuals, students, salaried customers, entrepreneurs and MSMEs.

Home Loan Schemes

• IDBI Bank Home Loan for purchase or construction of residential property.  
• Home Loan Interest Saver scheme to reduce interest burden through linked accounts.  
• Top-up home loans for renovation, expansion or personal requirements.  
• Supports affordable housing schemes such as Pradhan Mantri Awas Yojana (PMAY) where eligible borrowers may receive interest subsidies.

Education Loan Schemes

• Education loans for higher studies in India and abroad.  
• Covers tuition fees, hostel charges, travel expenses and study materials.  
• Offers a moratorium period covering the course duration plus a grace period before repayment begins.

Personal and Retail Loan Schemes

• Personal loans for salaried individuals and eligible customers.  
• Auto loans for purchase of new or used vehicles.  
• Loan against property and loans against securities.  
• Gold loans and overdraft facilities for short-term financing needs.

MSME and Business Schemes

• Loans for MSMEs including working capital finance, machinery loans and project finance.  
• Export-import finance and trade facilities for business customers.

Government Schemes

• MUDRA Loans under Pradhan Mantri Mudra Yojana for micro enterprises.  
• Pradhan Mantri Jan Dhan Yojana accounts for financial inclusion.  
• Implementation of other government-backed credit and welfare schemes through branch network.

These schemes help support housing, education, entrepreneurship and economic development.
""";

        case "Account Types":
          return """
IDBI Bank provides several account types for individuals, businesses and NRIs.

Savings Accounts

• IDBI Super Savings Account for individuals with debit card, passbook, cheque book and digital banking access.  
• Special savings variants for youth, women, senior citizens and children.  
• Pension and salary accounts with additional benefits such as zero balance and insurance coverage.

Current Accounts

• Designed for traders, professionals, SMEs and corporates with frequent transactions.  
• Provides cheque facilities, overdraft options and higher transaction limits.  
• Premium variants may offer additional transaction and service benefits.

Salary Accounts

• Salary account programmes for employees of corporates and institutions.  
• Usually offer zero balance requirements and bundled benefits such as insurance and preferential loan rates.

NRI Accounts

• NRE and NRO savings and term deposit accounts for Non-Resident Indians.  
• FCNR and RFC deposits allowing funds to be held in foreign currency.  
• Digital banking facilities and international debit cards available.

Fixed and Recurring Deposits

• Fixed deposits for flexible tenures with higher interest rates.  
• Recurring deposits for regular monthly savings.  
• Tax-saving 5-year fixed deposits eligible for income tax deductions.
""";

        case "Fees & Charges":
          return """
IDBI Bank charges certain service fees depending on account type, card variant and services used.

Debit Card Fees

• Debit cards may have annual maintenance fees after the first year.  
• Replacement charges apply if a card is lost or damaged.

ATM Transaction Charges

• Transactions at IDBI Bank ATMs are generally free within limits.  
• Withdrawals at other bank ATMs are free only up to a specified number of transactions per month.  
• Additional transactions may attract standard charges.

Minimum Balance Charges

• Many savings and current accounts require a minimum Monthly Average Balance.  
• Non-maintenance of the required balance may attract penalty charges depending on the account variant.

Loan Charges

• Loans may include processing fees expressed as a percentage of the loan amount.  
• Additional charges may include documentation, valuation, legal opinion and prepayment fees where applicable.

Other Charges

• SMS alerts and digital service charges  
• Cheque book issuance beyond free leaves  
• Stop payment instructions and duplicate statements  
• Locker and remittance service charges

Note:

Fees and policies may change periodically. Customers should always check the latest “Schedule of Charges” on the IDBI Bank website or contact the nearest branch for updated details.
""";

      }

    }

    if (bankName == "Union Bank of India") {

      switch (title) {

        case "Basic Information":
          return """
Union Bank of India is a leading public sector bank headquartered in Mumbai and one of the largest banks in India after the amalgamation of Andhra Bank and Corporation Bank in 2020.

Key Information:

• Established in 1919 to provide reliable banking and financial services to individuals, businesses and government entities across India.  
• The Government of India holds a majority stake in Union Bank of India, making it a trusted public sector bank.  
• Operates a wide network of 9,000+ domestic branches and 10,000+ ATMs across India along with Business Correspondent outlets.  
• Offers comprehensive services across retail banking, corporate and MSME banking, agriculture and rural banking, NRI services and international banking.  
• Provides modern digital channels such as Internet banking, mobile banking apps, UPI, QR payments and card services to enable convenient 24x7 banking.  
• Focuses strongly on financial inclusion by extending banking services to rural and semi-urban areas.

About Banking:

Banks like Union Bank of India play an important role in accepting deposits, lending money for personal and business purposes, enabling digital payments and supporting economic development by channelizing savings into investments.

Example Services:

• Savings and salary accounts with ATM/Debit cards and digital banking access.  
• Current accounts for traders, professionals and businesses.  
• Fixed deposits and recurring deposits for safe investments.  
• Home, education, vehicle, personal and business loans.  
• Insurance, mutual funds and government scheme services through bancassurance channels.
""";

        case "Interest Rates":
          return """
Interest rates determine how much customers earn on deposits and how much they pay on loans. These rates change periodically based on RBI policy and market conditions.

Savings Interest:

• Savings accounts generally earn around 2.75% p.a. for balances up to ₹50 lakh.  
• Higher balances may earn around 2.90% p.a. depending on slab.  
• Interest is calculated on the daily closing balance and credited quarterly.

Fixed Deposit Interest:

• Union Bank offers fixed deposits from 7 days up to 10 years.  
• Rates for regular customers generally range from about 2.75% – 6.30% p.a. depending on tenure.  
• Senior citizens may receive an additional 0.50%–0.75% p.a. interest.  
• Special limited-period FD schemes may offer higher promotional rates.

Loan Interest:

• Home loan interest rates are linked to external benchmarks and typically start around the 7%–9% p.a. range depending on credit score and borrower profile.  
• Personal loans and education loans generally have higher interest rates due to higher risk.  
• MSME loans may have special concessionary pricing under government schemes.

Tip:

Always compare current deposit and loan interest rates across banks before making financial decisions.
""";

        case "Schemes":
          return """
Union Bank of India offers multiple schemes designed for individuals, students, entrepreneurs and MSMEs.

Home Loan Schemes:

• Loans for purchase, construction, extension or renovation of houses.  
• Repayment tenure up to around 30 years for eligible borrowers.  
• Interest rates vary depending on CIBIL score and customer category.

Education Loan Schemes:

• Loans for higher education in India and abroad.  
• Covers tuition fees, travel and other academic expenses.  
• Repayment generally begins after a moratorium period.

Personal Loan Schemes:

• Unsecured loans for salaried individuals and professionals.  
• Used for expenses such as medical emergencies, travel or home improvement.

MSME and Business Schemes:

• Working capital loans, machinery loans and MSME credit facilities.  
• Special products for traders and small businesses.

Government Schemes:

• Mudra Loans under Pradhan Mantri Mudra Yojana for micro enterprises.  
• PM Jan Dhan Yojana accounts for financial inclusion.  
• Various MSME and entrepreneurship schemes implemented through bank branches.

These schemes help promote entrepreneurship, financial inclusion and economic growth.
""";

        case "Account Types":
          return """
Union Bank of India offers various account types to meet the needs of individuals, businesses and NRIs.

Savings Accounts:

• Regular savings accounts for individuals and households.  
• Digital savings accounts and BSBD (zero-balance) accounts.  
• Includes debit card, passbook and digital banking access.

Current Accounts:

• Designed for businesses and professionals with high transaction volumes.  
• May include overdraft facilities and higher transaction limits.

Salary Accounts:

• Accounts for salaried employees through employer partnerships.  
• Often include zero minimum balance and additional benefits.

NRI Accounts:

• NRE and NRO accounts for managing overseas and Indian income.  
• FCNR deposits available in foreign currency.

Fixed and Recurring Deposits:

• Fixed deposits from 7 days to 10 years with higher interest.  
• Recurring deposits for monthly savings goals.  
• Senior citizens receive additional interest benefits.
""";

        case "Fees & Charges":
          return """
Union Bank of India charges certain service fees depending on account type and services used.

Debit Card Charges:

• Annual charges vary depending on card type such as classic or premium debit cards.

ATM Charges:

• A limited number of ATM transactions per month are free.  
• Additional transactions beyond the free limit may incur charges.

Minimum Balance Charges:

• Some accounts require maintaining a minimum average balance.  
• Non-maintenance of balance may attract penalty charges.

Loan Processing Fees:

• Loans such as home loans may include processing fees, often around 0.50% of the loan amount plus applicable taxes.

Other Service Charges:

• SMS alerts  
• Cheque book issuance beyond free limits  
• Stop payment instructions  
• Locker rent and remittance charges

Note:

Fees and policies may change periodically. Customers should check the latest schedule of charges on the Union Bank of India website or contact their branch for updated details.
""";

      }

    }

    if (bankName == "Indian Bank") {

      switch (title) {

        case "Basic Information":
          return """
Indian Bank is a leading Indian public sector bank established in 1907 and headquartered in Chennai.
Since nationalisation in 1969, it has been owned by the Government of India and operates under the Ministry of Finance.
After the merger of Allahabad Bank in April 2020, Indian Bank became one of the largest public sector banks in India, serving over 10 crore customers through thousands of branches and ATMs across the country and select overseas locations.

Key Information:
• Public sector bank with majority Government of India ownership.
• Head office located in Chennai with a large branch, ATM and business correspondent network across India.
• Provides services in retail banking, MSME banking, corporate banking, rural and agricultural banking and international banking.
• Offers modern digital banking facilities including Internet banking, mobile banking apps and UPI-based payments.
• Supports government welfare schemes, financial inclusion and priority-sector lending.

About Banking:
Banks like Indian Bank mobilise deposits from customers, provide loans to individuals and businesses, enable digital payments and support economic growth by channelising savings into productive investments.

Example Services:
• Savings and current accounts for individuals, institutions and businesses.
• Retail loans such as home loans, vehicle loans, education loans, gold loans and personal loans.
• MSME finance, working capital loans and trade finance services.
• Investment and insurance distribution through tie-ups with financial institutions.
""";

        case "Interest Rates":
          return """
Interest rates at Indian Bank determine how much customers earn on deposits and how much they pay when borrowing funds. These rates are revised periodically based on RBI policy and internal bank guidelines.

Savings Interest:
• Savings accounts generally offer interest around 2.75% – 2.80% per annum.
• Interest is calculated on the daily closing balance and credited quarterly.
• Most savings account variants follow the same base savings rate.

Fixed Deposit (FD):
• Fixed deposits are available for tenures ranging from 7 days to 10 years.
• FD rates for regular customers typically range from about 2.80% p.a. to around 6.40%–6.45% p.a. depending on tenure.
• Senior citizens generally receive an additional 0.50% interest on many deposit schemes.
• Special schemes such as IND Secure (444-day deposit) and Ind Green (555-day deposit) may offer slightly higher promotional rates.

Loan Interest:
• Home loans are linked to external benchmark rates and typically start in the mid-7% p.a. range depending on borrower profile.
• Education loans and personal loans have different rate structures depending on credit score, loan amount and repayment tenure.
• The final interest rate depends on factors such as income, credit score and relationship with the bank.

Tip:
Always check the latest interest rate chart on the official Indian Bank website or at a branch before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
Indian Bank offers a variety of financial schemes designed for individuals, students, entrepreneurs and MSMEs.

Home Loan Schemes:
• IB Home Loan for purchase, construction, renovation or extension of residential property.
• Special schemes for NRIs and affordable housing segments such as EWS/LIG/MIG under PMAY guidelines.
• IB Home Loan Plus provides top-up loans for existing home loan customers.

Education Loan Schemes:
• Education loans for higher studies in India and abroad based on the IBA model education loan scheme.
• Skill loans for vocational and technical courses.
• Loans available through the PM-Vidyalakshmi portal with flexible repayment options.

Personal Loan Schemes:
• IB Clean Loan for salaried individuals with loan limits linked to monthly salary.
• IB Saral and IB Professional loans for general salaried customers and professionals.
• Insta Cash and pre-approved digital loans for eligible existing customers.
• Pension loans available for pensioners maintaining accounts with Indian Bank.

Government Schemes:
• Participation in schemes such as PMAY for housing subsidies.
• Credit facilities for MSMEs under CGTMSE and other government initiatives.
• Financial inclusion programs for low-income customers and DBT beneficiaries.

These schemes support housing, education, personal financial needs and business growth.
""";

        case "Account Types":
          return """
Indian Bank offers multiple account types designed for individuals, businesses, NRIs and institutions.

Savings Accounts:
• Standard savings accounts with debit card, passbook and digital banking access.
• Specialised accounts such as IB Smart Kid, IB Kishore for minors, IB Mahila Shakti for women and IB GenX for youth.
• Defence personnel accounts such as IB Salaam and pension accounts for retirees.
• Digital savings accounts and basic savings accounts for financial inclusion customers.

Current Accounts:
• Designed for traders, professionals, firms and companies with frequent high-value transactions.
• Provides cheque facilities, higher transaction limits and overdraft facilities for eligible customers.

Salary and Pension Accounts:
• Salary accounts for employees through corporate tie-ups, usually with zero balance facility.
• Pension accounts for retirees receiving pension through Indian Bank.

NRI Accounts:
• NRE and NRO savings and term deposit accounts for Non-Resident Indians.
• FCNR deposits available in foreign currency for protection against exchange-rate risk.

Fixed Deposit and Recurring Deposits:
• Fixed deposits with tenures from 7 days to 10 years offering higher interest than savings accounts.
• Recurring deposits for regular monthly savings.
• Tax-saving FDs with a 5-year lock-in period under income tax provisions.
""";

        case "Fees & Charges":
          return """
Indian Bank charges certain service fees depending on the type of account, debit card and banking services used.

Debit Card Charges:
• Annual maintenance fees vary depending on debit card type such as classic, platinum or contactless cards.
• Basic savings accounts and salary accounts may have reduced or zero annual fees.

ATM Charges:
• A limited number of ATM transactions each month are free at Indian Bank and other bank ATMs.
• Additional transactions beyond the free limit may attract standard charges.

Minimum Balance Charges:
• Basic or small savings accounts may have zero minimum balance requirements.
• Other savings or current accounts may require maintaining an average monthly balance to avoid penalty charges.

Loan Processing Fees:
• Loans such as home loans and personal loans may include processing fees calculated as a percentage of the loan amount.
• Additional charges may include documentation, valuation or inspection fees.

Other Charges:
• SMS alerts
• Cheque book issuance beyond free limits
• Stop payment instructions
• Account certificates and branch services

Note:
Fees and charges are subject to revision. Customers should check the latest schedule of charges on the official Indian Bank website or confirm with the nearest branch.
""";

      }

    }

    if (bankName == "Saraswat Bank") {

      switch (title) {

        case "Basic Information":
          return """
Saraswat Co-operative Bank Ltd. is India’s largest urban co-operative bank with its origins in Mumbai and a strong presence across Maharashtra, Goa, Karnataka, Madhya Pradesh and a few other states.

The bank began on 14 September 1918 as “The Saraswat Co-operative Banking Society”, created to support families in financial distress by providing short-term funds for weddings, medical expenses and debt repayment.
In 1933 it was converted into a full-fledged Urban Co-operative Bank, and over the decades it has grown steadily in membership, resources, assets and branch network.

Key Profile:
• Type: Urban Co-operative Bank with multi-state co-operative structure.
• Established: 1918 (as a co-operative society), converted into a bank in 1933.
• Strong focus on retail customers, SMEs, traders and professionals.
• Regional strength mainly in western India.

Services Offered:
• Retail banking services such as savings accounts, current accounts, deposits, lockers and remittance services.
• Loan products including home loans, personal loans, vehicle loans, SME loans and loan against property.
• Deposit schemes including regular fixed deposits, tax-saving deposits and NRI deposits such as NRE/NRO/FCNR.
• Digital banking services such as debit cards, internet banking and mobile banking.

Role in Banking:
Saraswat Bank mobilises deposits from individuals and businesses and channels them into loans for housing, trade and small enterprises, supporting regional economic activity.

Banks like Saraswat Bank play an important role in:
• Safely holding customer deposits.
• Providing loans for housing, education and business.
• Enabling secure digital payments and fund transfers.
""";

        case "Interest Rates":
          return """
Interest rates determine how much customers earn on deposits and how much they pay on loans. Rates are revised periodically, so customers should always check the latest figures from the bank’s official website or branch.

Savings Interest:
• Saraswat Bank offers interest on savings accounts based on bank policy.
• Interest is usually calculated on the daily balance and credited periodically.

Fixed Deposit Interest:
• The bank offers various FD schemes including regular FD, monthly income and quarterly income deposits.
• FD rates typically range from about 3% for very short tenures to above 7% for selected longer tenures.
• Senior citizens generally receive an additional interest benefit of around 0.50% or more.

Loan Interest:

Home Loans:
• Saraswat Bank provides home loans under schemes such as “Vastu Siddhi”.
• Interest rates usually start around the mid-7% range and may go above 9% depending on borrower profile and tenure.

Personal Loans:
• Personal loan rates depend on customer profile, salary account relationship and loan tenure.

Important:
All interest rates are subject to change. Customers should confirm the latest rates with the bank before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
Saraswat Co-operative Bank provides multiple deposit and loan schemes designed for individuals, families, professionals, SMEs and NRIs.

Home Loan Schemes:
• Vastu Siddhi Home Loan scheme for purchase, construction or renovation of residential property.
• Special home loan variants may be available for women borrowers, NRIs and defence personnel.

Other Retail Loans:
• Personal loans for salaried individuals and professionals to meet personal needs such as medical expenses, education or travel.
• Vehicle loans and loans against property for major financial requirements.

Deposit Schemes:
• Domestic fixed deposits with multiple tenure options.
• Monthly and quarterly income schemes.
• Tax-saving deposit schemes with lock-in periods.

NRI Schemes:
• NRE and NRO deposit accounts for Non-Resident Indians.
• Foreign currency deposits and other investment options for NRIs.

Government Schemes:
• Mudra loans for micro and small enterprises.
• Basic savings accounts for financial inclusion and direct benefit transfers.

These schemes help customers with savings, investments, housing finance and business development.
""";

        case "Account Types":
          return """
Saraswat Co-operative Bank offers several account types for individuals, businesses and NRIs.

Savings Accounts:
• Regular savings accounts for individuals and families.
• Debit card, cheque book and digital banking access available.
• Minimum balance requirements may vary by branch category.

Special Savings Accounts:
• Micro-finance and financial-inclusion accounts for low-income groups and self-help groups.

Current Accounts:
• Designed for businesses, firms and traders with high transaction requirements.
• Typically non-interest bearing but offer cheque facilities and higher transaction limits.

NRI Accounts:
• NRE and NRO savings/current accounts for Non-Resident Indians.
• NRE/NRO fixed deposits and foreign-currency deposit options.

Fixed Deposits:
• Domestic term deposits from 7 days up to 10 years.
• Options for cumulative interest or periodic payouts.
• Tax-saving fixed deposit schemes with lock-in periods.

Customers can select account types based on their balance level, transaction needs and residency status.
""";

        case "Fees & Charges":
          return """
Saraswat Co-operative Bank charges certain service fees depending on account type, card type and services used.

Debit Card Fees:
• Debit cards such as Classic and Platinum variants may have annual maintenance fees.
• Replacement charges may apply if a card is lost or damaged.

ATM Charges:
• Transactions at Saraswat Bank ATMs in India are generally free within allowed limits.
• Additional ATM usage beyond limits or international ATM transactions may attract charges.

Minimum Balance Charges:
• Savings accounts require maintaining an Average Quarterly Balance (AQB) based on branch category.
• Non-maintenance of required balance may attract penalty charges.

Loan Processing Fees:
• Loans such as home loans and personal loans may include processing charges calculated as a percentage of the loan amount.

Other Service Charges:
• Cheque books beyond free limits.
• Duplicate statements or passbooks.
• Demand drafts, remittances and other branch services.

Note:
All fees and charges are subject to revision. Customers should check the latest schedule of charges on the Saraswat Bank website or confirm with their branch.
""";

      }

    }

    if (bankName == "Thane Bharat Sahakari Bank") {

      switch (title) {

        case "Basic Information":
          return """
Thane Bharat Sahakari Bank Ltd. is a scheduled co-operative bank headquartered in Thane, Maharashtra, serving retail customers and small businesses across the Mumbai, Thane, Raigad and Pune regions.

The bank was established in 1979 after being registered in 1978 and receiving its banking licence from the Reserve Bank of India. It began operations on 29 April 1979 and later received Scheduled Bank status in March 2003.

From a single branch in Thane, the bank has expanded to around 30 branches across Maharashtra, becoming a well-known regional co-operative bank.

Key Information:
• Scheduled Urban Co-operative Bank serving individuals, professionals and small businesses.
• Around 30 branches across Mumbai, Thane, Raigad and Pune districts.
• Offers retail banking services including deposits, loans, lockers and digital banking facilities.
• Supports electronic payment systems such as UPI, NEFT and RTGS for fast fund transfers.
• Deposits are covered under DICGC deposit insurance up to the statutory limit.

About Banking:
Banks like Thane Bharat Sahakari Bank play an important role in:
• Safely accepting deposits from the public.
• Providing loans to individuals, traders and small businesses.
• Enabling digital payments and fund transfers.
• Supporting local economic development by financing community businesses.

Example Services:
• Savings and current accounts for individuals and businesses.
• Fixed deposits and recurring deposits with multiple tenure options.
• Housing loans, vehicle loans and business loans.
• ATM/debit cards, lockers and internet/mobile banking services.
""";

        case "Interest Rates":
          return """
Interest rates determine how much customers earn on deposits and how much they pay on loans. Rates are revised periodically, so customers should always check the latest schedule from the bank.

Savings Interest:
• Savings accounts earn interest at a rate decided by the bank and revised periodically.
• Interest is generally calculated on the daily closing balance and credited at regular intervals.

Fixed Deposit and Recurring Deposit Interest:
• Short-term deposits (7–30 days) earn around 3.25% p.a.
• Deposits from 31–90 days earn about 4.00% p.a.
• Deposits from 91–180 days earn around 4.75% p.a.
• Deposits from 181 days to 1 year earn around 6.00% p.a.
• Deposits from 1 year to 3 years earn around 6.50% p.a.
• Deposits above 3 years to 10 years earn around 6.25% p.a.
• Special 444-day deposits may offer around 7.00% p.a. for regular customers and slightly higher for senior citizens.
• Premature withdrawal of fixed deposits usually attracts a penalty of about 1% on the applicable rate.

Loan Interest:
• Housing loan interest rates may range roughly between about 7.5% and 8.5% p.a. depending on loan amount and borrower profile.
• Interest rates for other loans such as vehicle loans or business loans vary depending on loan type and bank policy.

Tip:
Customers should always verify the latest interest rates with the bank before opening deposits or taking loans.
""";

        case "Schemes":
          return """
Thane Bharat Sahakari Bank offers several deposit and loan schemes designed for local families, salaried individuals, professionals and small businesses.

Home Loan Schemes:
• Housing loans for purchase, construction or renovation of residential properties.
• Loans are typically secured by property mortgage and repaid through monthly EMIs.
• Interest rates depend on borrower eligibility and bank policy.

Vehicle Loan Schemes:
• Loans for purchase of new or used vehicles.
• Flexible repayment tenures based on borrower income and repayment capacity.

Business and MSME Loans:
• Working capital loans and term loans for traders, professionals and small enterprises.
• Facilities may include cash credit, overdraft and term loans secured by collateral.

Deposit Schemes:
• Fixed deposits with tenures ranging from 7 days to 10 years.
• Monthly and quarterly interest payout deposit options.
• Tax-saving fixed deposit scheme with a 5-year lock-in period under Section 80C.

Banking Infrastructure:
• Participation in electronic payment systems such as NEFT and RTGS.
• Deposits covered under DICGC deposit insurance as per regulatory limits.

These schemes help individuals and businesses save money safely and access credit for growth and development.
""";

        case "Account Types":
          return """
Thane Bharat Sahakari Bank provides several account types designed for individuals, families, traders and businesses.

Savings Accounts:
• Savings accounts for individuals and families to deposit funds and earn interest.
• Facilities include passbook, ATM/debit card and digital banking services.
• Customers can use UPI, NEFT and RTGS for online transactions.

Current Accounts:
• Current accounts designed for businesses, firms and professionals with frequent transactions.
• Usually do not earn interest but provide cheque book facilities and high transaction limits.
• Overdraft or cash credit facilities may be available subject to approval.

Fixed Deposit Accounts:
• Fixed deposits allow customers to invest money for a fixed period ranging from 7 days to 10 years.
• Options include cumulative deposits and monthly or quarterly interest payouts.

Recurring Deposit Accounts:
• Customers deposit a fixed amount monthly to build long-term savings.
• Suitable for salaried individuals who want to accumulate funds gradually.

Special Accounts:
• The bank also offers customised accounts for co-operative societies, housing societies and institutions within its operating area.
""";

        case "Fees & Charges":
          return """
Thane Bharat Sahakari Bank applies service charges depending on account type, card type and services used.

Debit Card Charges:
• Debit cards are generally free for the first year.
• From the second year onward an annual maintenance fee of about ₹150 plus applicable taxes may apply.
• Charges may apply for card replacement or additional services.

ATM Charges:
• Transactions at the bank’s own ATMs may be free within allowed limits.
• Transactions at other bank ATMs beyond free limits may attract charges.

NEFT and RTGS Charges:
• RTGS transfers between ₹2 lakh and ₹5 lakh may attract charges of about ₹25 plus taxes.
• RTGS transfers between ₹5 lakh and ₹10 lakh may attract charges around ₹50 plus taxes.
• NEFT charges depend on transaction amount slabs.

Minimum Balance Charges:
• Certain savings or current accounts may require maintaining a minimum balance.
• If the balance falls below the required level, penalty charges may apply.

Other Charges:
• Charges for cheque returns, duplicate statements, stop payment instructions and locker rent may apply as per bank schedule.

Note:
All fees and charges may change from time to time. Customers should always refer to the latest Schedule of Charges issued by the bank.
""";

      }

    }

    if (bankName == "Thane District Central Co-operative Bank") {

      switch (title) {

        case "Basic Information":
          return """
The Thane District Central Co-operative Bank Ltd. (TDCC Bank) is a major district central co-operative bank serving Thane district in Maharashtra.

Key Information:

• Registered under the Maharashtra Co-operative Societies Act, 1960 and licensed by the Reserve Bank of India to conduct banking operations.
• Started with 7 branches in 1958 and has grown to more than 90 branches across Thane district.
• Serves over 10 lakh customers including farmers, co-operative societies, traders and individuals.
• Functions as the apex bank for co-operative societies in Thane district and is part of the three-tier rural co-operative credit structure.
• Provides deposits, loans and banking services for agriculture, small businesses, SHGs and the general public.
• Recipient of several awards including the “Late Vaikunthbhai Mehta Best District Co-op Bank” award and recognition from NABARD for SHG linkage programs.

About Banking:

District Central Co-operative Banks like TDCC Bank mobilise deposits from individuals and societies and provide loans primarily to farmers, rural artisans and small enterprises.
They play a crucial role in rural credit, crop finance and agricultural development through close coordination with Primary Agricultural Credit Societies (PACS).

Example Services:

• Savings and current accounts for individuals, farmers and co-operative societies
• Fixed deposits and recurring deposits
• Crop loans and agricultural finance through co-operative societies
• Housing loans, vehicle loans, gold loans, education loans and personal loans
• Special schemes for women, SHGs and small entrepreneurs
• ATM/debit cards, SMS alerts, e-statements and basic digital banking services
""";

        case "Interest Rates":
          return """
Interest rates at TDCC Bank determine how much customers earn on deposits and how much they pay on loans. Rates may change periodically, so customers should always check the latest rate chart.

Savings Interest:

• Savings accounts earn interest as per the bank’s current deposit rate circular.
• Interest is generally calculated on daily or monthly balances and credited periodically.

Term Deposit Interest:

• Fixed deposits and recurring deposits are available for various tenures ranging from a few months to several years.
• Longer deposit tenures usually offer higher interest rates.
• Senior citizens may receive slightly higher interest rates as per bank policy.
• Customers can choose cumulative deposits (interest reinvested) or non-cumulative deposits with periodic payouts.

Loan Interest (Indicative):

• Housing Loan – approximately 8.75% p.a. on EMI basis.
• Vehicle Loan – about 9.75% p.a. for private use and around 11% p.a. for commercial vehicles.
• Personal Loan – around 13% p.a.
• Business Loan – approximately 9.75% p.a.
• Gold Loan – around 11.50% p.a. for general customers and around 10.50% p.a. for farmers.
• Education Loan – concessional rates such as around 9.50% p.a. for male students and 9.00% p.a. for female students.

Note:
Actual rates may change depending on bank policy and RBI regulations.
Customers should verify the latest rates before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
TDCC Bank provides multiple schemes focused on agriculture, rural development, housing and personal financial needs.

Agriculture & Crop Loan Schemes:

• Short-term crop loans provided through Primary Agricultural Credit Societies (PACS) for seasonal agricultural activities.
• Medium-term loans for irrigation systems, wells, pump sets, tractors and farm equipment.
• Loans for allied agricultural activities such as dairy farming, poultry and goat farming.
• Timely repayment of crop loans may qualify for interest concessions or government incentives.

Housing Loan Scheme:

• Loans for purchase, construction or renovation of residential property.
• Margin requirements typically range between 15% and 25%.
• Repayment tenure may extend up to about 20 years.

Education Loan Scheme:

• Loans for higher education in India and abroad.
• Covers tuition fees and educational expenses.
• Female students may receive slightly lower interest rates.

Personal & Salary Loan Schemes:

• Personal loans and salary loans for employees and professionals.
• Special overdraft facilities such as Teacher Salary Overdraft Loan.

Other Loan Schemes:

• Vehicle loans for two-wheelers and four-wheelers.
• Business loans for small traders and entrepreneurs.
• Gold loans for individuals and concessional gold loans for farmers.
• Credit schemes for co-operative societies and SHGs.

These schemes help support agriculture, rural employment, housing and small businesses in the district.
""";

        case "Account Types":
          return """
TDCC Bank offers various account types suitable for farmers, co-operative societies, traders and individual customers.

Savings Account:

• Savings accounts for individuals, farmers and members of co-operative societies.
• Earn interest on balances as per bank policy.
• Facilities include passbook, cheque book (where applicable), ATM/debit card and SMS alerts.

Current Account:

• Designed for businesses, traders and institutions with frequent transactions.
• Generally does not earn interest but offers cheque facilities and higher transaction limits.
• Supports payments through RTGS, NEFT and other banking channels.

Term Deposit Account:

• Fixed deposits with higher interest rates for customers willing to lock funds for a specific tenure.
• Available with cumulative or periodic interest payout options.

Recurring Deposit Account:

• Customers deposit a fixed amount monthly to build savings over time.
• Suitable for salaried individuals and small savers.

Special Co-operative Accounts:

• Accounts designed for PACS, co-operative societies and SHGs.
• Supports rural credit and co-operative financial activities within the district.

Customers can choose accounts based on transaction needs, savings goals and eligibility.
""";

        case "Fees & Charges":
          return """
TDCC Bank applies service charges depending on account type and banking services used. The latest charges are provided in the bank’s official schedule of charges.

Common Charges:

Account & Debit Card Charges:

• Savings and current accounts may require minimum balance maintenance.
• Debit or ATM cards may have issuance or annual maintenance charges depending on the account type.
• SMS alerts or statement services may carry nominal charges.

Transaction Charges:

• NEFT, RTGS and IMPS transfers may have transaction fees depending on the amount slab.
• Additional cheque books beyond free leaves may attract charges.
• Stop payment instructions and cheque return charges may apply.

Loan Related Charges:

• Processing fees are usually charged on loans such as housing, vehicle, personal or business loans.
• Borrowers may also pay valuation, legal and documentation charges.
• Penalties may apply for delayed EMI payments or cheque bounce.

Other Service Charges:

• Demand drafts and pay orders
• ECS/NACH mandate processing
• Duplicate passbooks or statements
• Certificate issuance and other miscellaneous services

Note:
Customers should always check the latest schedule of charges at TDCC Bank branches or the official website before using chargeable services.
""";

      }

    }

    if (bankName == "GS Mahanagar Co-operative Bank") {

      switch (title) {

        case "Basic Information":
          return """
GS Mahanagar Co-operative Bank Ltd. is a scheduled urban co-operative bank headquartered in Mumbai, serving customers across Maharashtra.

Key Information:

• Established on 6 October 1973 as “The Ahmednagar Sahakari Bank Ltd.” to support workers, vendors, traders and small businesses.
• Renamed “The Mahanagar Co-operative Bank Ltd.” in 1998 and granted Scheduled Bank status by the Reserve Bank of India in the same year.
• Adopted the present name “GS Mahanagar Co-operative Bank” in 2018 in honour of its founder Late Solicitor Shri G. S. Shelke.
• Operates around 70 branches and a network of ATMs across Maharashtra.
• Provides services mainly to middle-class families, salaried employees, traders, professionals and co-operative societies.
• Offers modern banking facilities including Core Banking (Finacle), ATM/Debit cards, RTGS, NEFT, IMPS, internet banking and other digital services.

About Banking:

Urban co-operative banks like GS Mahanagar Bank play an important role in mobilising savings from local communities and providing credit to individuals and small businesses.

Example Services:

• Savings and daily savings deposit accounts with ATM/debit cards.
• Current accounts for traders, professionals and businesses.
• Fixed deposits, recurring deposits and tax-saving deposits.
• Home loans, personal loans, education loans, vehicle loans and gold loans.
""";

        case "Interest Rates":
          return """
Interest rates at GS Mahanagar Co-operative Bank determine how much customers earn on deposits and how much they pay on loans. Rates may change periodically, so customers should always check the latest bank schedule.

Savings Interest:

• Savings accounts and daily savings deposits generally earn interest around 2.50% per annum.
• Interest is calculated on the daily balance and credited periodically.

Fixed Deposit Interest:

• Fixed deposits are available from 7 days up to 10 years.
• Interest rates generally range from about 3.25% p.a. for short tenures to around 7.50% p.a. for selected longer tenures.
• Senior citizens usually receive an additional interest benefit over regular rates.
• A dedicated “GS Mahanagar Tax Saver Deposit Scheme” offers a 5-year lock-in deposit option.

Loan Interest:

• The bank follows a Benchmark Prime Lending Rate (BPLR) system, with BPLR around 12.00% p.a.
• Loans against fixed deposits are generally priced slightly above the FD interest rate.
• Personal loan interest rates typically range from around 11.50% p.a. to 15.00% p.a.
• Home loans, education loans, vehicle loans and business loans have separate rate slabs based on scheme and borrower profile.

Tip:

Customers should check the latest interest rates before opening deposits or applying for loans.
""";

        case "Schemes":
          return """
GS Mahanagar Co-operative Bank offers several schemes designed for salaried individuals, traders, professionals and small businesses.

Home Loan Schemes:

• Housing loans for purchase, construction or renovation of residential property.
• Special “Gruhalaxmi Housing Loan Scheme” offers lower interest rates when the property is purchased in a woman’s name.
• Flexible repayment tenures allow customers to repay through manageable EMIs.

Personal Loan Schemes:

• Personal loans for salaried employees, professionals and business owners.
• Suitable for expenses such as medical treatment, education, travel or home repairs.

Business Loan Schemes:

• Business loans and working capital facilities for traders and small enterprises.
• Overdraft and cash credit facilities may be available for business operations.

Education, Gold and Vehicle Loans:

• Education loans for higher studies.
• Gold loans against pledged jewellery for short-term funds.
• Vehicle loans for purchase of two-wheelers and four-wheelers.

These schemes help customers finance housing, business growth and personal needs.
""";

        case "Account Types":
          return """
GS Mahanagar Co-operative Bank provides multiple account types for individuals, traders and institutions.

Savings Accounts:

• Regular savings accounts for individuals and families.
• Daily savings deposit accounts designed for traders and small vendors who deposit cash frequently.
• Facilities include passbook, ATM/debit card and digital banking access.

Current Accounts:

• Current accounts for businesses and professionals with frequent transactions.
• Typically do not earn interest but provide higher transaction limits and cheque facilities.

Fixed Deposit Accounts:

• Fixed deposits available from a few days up to 10 years.
• Offer higher interest than savings accounts with cumulative or periodic payout options.

Tax Saver Deposits:

• Special 5-year tax saver fixed deposit scheme eligible for tax benefits under applicable rules.

Customers can select accounts based on their savings goals and transaction requirements.
""";

        case "Fees & Charges":
          return """
GS Mahanagar Co-operative Bank charges service fees depending on the account type and services used.

Debit / ATM Card Charges:

• Debit cards may have annual maintenance charges depending on the card type.
• Charges may apply for card replacement, PIN reissue and additional ATM usage.

ATM and Transaction Charges:

• A limited number of ATM transactions may be free each month.
• Additional withdrawals or balance enquiries beyond the free limit may attract charges.

Minimum Balance Charges:

• Some savings and current account variants require maintaining a minimum balance.
• Non-maintenance of balance may lead to penalty charges.

Deposit Related Charges:

• Premature withdrawal of fixed deposits may attract a penalty of around 1% on the applicable interest rate.
• Charges may apply for duplicate deposit receipts or other account changes.

Loan Related Charges:

• Processing fees are generally charged on home loans, personal loans and business loans.
• Legal, valuation or documentation charges may apply for secured loans.

Other Service Charges:

• SMS alerts
• Cheque books beyond free limits
• Stop payment instructions
• Other branch services as per bank policy

Note:
Customers should check the latest Schedule of Charges available at bank branches or the official website for updated information.
""";

      }

    }
    return "Information not available.";
  }

  @override
  Widget build(BuildContext context) {
    final content = getContent();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$bankName - $title",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}