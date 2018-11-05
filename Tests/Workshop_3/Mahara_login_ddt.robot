*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser To Mahara
Test Teardown   Capture Screenshot And Close Browser
Resource    ../../Keywords/Mahara/Mahara_Keywords.txt
Resource    Test_data.robot     

*** Variables ***
@{PWDS}=    12345    21355    64365    86465

*** Test Cases ***
MahaMahara Invalid login ddt
    [Template]    Login with invalid ${password} should fail
    12345
    21355
    64365
    86465
    
MahaMahara Invalid login list
    [Template]    Login with invalid ${password} should fail
    :FOR    ${password}    IN    @{PWDS}
    \    ${password}
    
*** Keywords ***    
Login with invalid ${pwd} should fail
    Login To Mahara    Admin    ${pwd}
    Wait Until Page Contains Element    id=messages
    Page Should Contain    You have not provided the correct credentials to log in. Please check your username and password are correct.
    Page Should Contain    There was an error with submitting this form. Please check the marked fields and try again.  