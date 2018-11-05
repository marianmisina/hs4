*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../Keywords/Eshop/Eshop_Keywords.robot
Resource    ../../Test_Data/Eshop/Registration_Data.robot
Resource    ../../Keywords/Mahara/Mahara_Keywords.txt
Test Setup    Open Eshop Registration Form    ${email}
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${email}    test@hackershool.cz

*** Test Cases ***
Invalid zip Code
    [Template]    Invalid Zip Code Should Fail
    :FOR    ${zip_code}    IN    @{invalid_zip_codes}
    \    ${zip_code}    &{valid_data}

*** Keywords ***
Invalid Zip Code Should Fail
    [Arguments]    ${zip_code}    &{test_data}
    Set To Dictionary    ${test_data}   postcode=${zip_code}
    Fill In Registration Form    &{test_data}
    Click Button    id=submitAccount
    Page Should Contain    The Zip/Postal code you've entered is invalid. It must follow this format: 00000
    