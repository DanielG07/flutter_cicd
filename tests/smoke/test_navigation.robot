*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Smoke Test Navigation
    Open Browser    https://example.com    chrome
    Title Should Be    Example Domain
    Close Browser