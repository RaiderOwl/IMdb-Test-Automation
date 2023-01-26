*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
click_but
    [Arguments]    ${xpath}
    Click Button    locator=${xpath}

click_ele
    [Arguments]    ${xpath}
    Click Element    locator=${xpath}

input
    [Arguments]    ${xpath}    ${text}
    Input Text    locator=${xpath}    text=${text}

max_browser
    Maximize Browser Window

wait_ele_visible
    [Arguments]    ${xpath}    ${second}
    Wait Until Element Is Visible    locator=${xpath}    timeout=${second}    error="Element is not visible after ${second} seconds"

wait_ele_not_visible
    [Arguments]    ${xpath}    ${second}
    Wait Until Element Is Not Visible    locator=${xpath}    timeout=${second}    error="Element is not visible after ${second} seconds"

wait_and_click
    [Arguments]    ${xpath}    ${second}
    wait_ele_visible    ${xpath}    ${second}
    click_ele    ${xpath}

scroll
    [Arguments]    ${xpath}
    Scroll Element Into View    locator=${xpath}

check_text
    [Arguments]    ${xpath}    ${text}
    SeleniumLibrary.Element Text Should Be    locator=${xpath}    expected=${text}    message="Text strings dont match with each other"

log
    [Arguments]    ${string}
    Log To Console    message=${string}