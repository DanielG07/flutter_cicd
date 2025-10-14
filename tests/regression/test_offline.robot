*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Offline Scenario Test
    Open Browser    https://example.com/offline    chrome
    Simulate Offline Mode
    Element Should Be Visible    id:offline-message
    Close Browser