*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Regression Test Input Validation
    Open Browser    https://example.com/form    chrome
    Input Text    id:username    test_user
    Input Text    id:password    test_pass
    Click Button    id:submit
    Element Should Be Visible    id:success-message
    Close Browser