*** Settings ***
Library        Browser
...         timeout=30s
Library        Dialogs

Test Teardown       Close Browser

*** Variables ***
${BROWSER}      chromium
${HEADLESS}     False

*** Test Cases ***
Test Open Page
    New Browser     browser=${BROWSER}        headless=${HEADLESS}
    New Context
    New Page    https://google.com
    Type Text   input[name='q']     Beruang

Test Login Page
    New Browser     browser=${BROWSER}          headless=${HEADLESS}
    New Context
    New Page    http://the-internet.herokuapp.com/login
    Type Text   id=username     tomsmith
    Type Text   id=password     SuperSecretPassword!
    Click       button[type='submit']
    Wait For Elements State       id=flash
    Set Assertion Formatters    {"Get Text": ["strip", "normalize spaces"]}
    Get Text    id=flash    ==      You logged into a secure area! ×