*** Settings ***
Library    SeleniumLibrary 

*** Keywords ***
Open Eshop Registration Form
    [Arguments]    ${email}
    Open Browser    http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation    chrome
    Maximize Browser Window
    Input Text    id=email_create    ${email}
    Click Button    id=SubmitCreate
    Wait Until Page Contains Element    id=submitAccount
    
Fill In Registration Form
    [Arguments]    &{test_data}
    Input Text    id=customer_firstname    ${test_data['firstname']}
    Input Text    id=customer_lastname    ${test_data['lastname']}
    Input Text    id=passwd    ${test_data['password']}
    Input Text    id=address1    ${test_data['address']}
    Input Text    id=city    ${test_data['city']}
    Select From List By Label    id=id_country    ${test_data['country']}
    Input Text    id=postcode    ${test_data['postcode']}
    Input Text    id=phone   ${test_data['phone']}
    Input Text    id=phone_mobile   ${test_data['phone_mobile']}