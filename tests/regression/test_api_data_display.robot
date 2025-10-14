*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Regression Test API Data Display
    Open Browser    https://example.com/api-data    chrome
    Element Should Be Visible    id:data-table
    Table Cell Should Contain    id:data-table    1    1    Expected Value
    Close Browser