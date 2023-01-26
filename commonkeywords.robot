*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    XML
Resource    shortcuts.robot
Resource    xpathvariables.robot

*** Keywords ***
func_100_open_browser
    Open Browser    ${site_url}    ${browser}
    max_browser

func_110_goto_oscars_page
    wait_and_click    ${xpath_menu_button}    ${to}
    wait_and_click    ${xpath_oscars_link}    ${to}

func_120_pick_year
    wait_and_click    ${xpath_1929_link}    ${to}

func_130_pick_series
    [Arguments]    ${xpath}
    scroll    ${xpath_honorary_awards_text}
    click_ele    ${xpath}

func_140_get_series_info
    wait_ele_visible    ${xpath_director_text}    ${to}
    ${variable1}=    Get Text    ${xpath_director_text}
    ${variable2}=    Get Text    ${xpath_writer_text}
    ${variable3}=    Get Text    ${xpath_stars_text}
    Set Global Variable    ${variable1}
    Set Global Variable    ${variable2}
    Set Global Variable    ${variable3}
    log    Director:${variable1}
    log    Writer:${variable2}
    log    Stars:${variable3}

func_150_goto_home_page
    click_ele    ${xpath_home_button}

func_160_goto_series_page_with_search_bar
    [Arguments]    ${xpath}    ${serie_name}
    wait_ele_visible    ${xpath_search_box}    ${to}
    input    ${xpath_search_box}    ${serie_name}
    wait_and_click    ${xpath}    ${to}

func_170_check_series_info
    wait_ele_visible    ${xpath_director_text}    ${to}
    check_text    ${xpath_director_text}    ${variable1}
    check_text    ${xpath_writer_text}    ${variable2}
    check_text    ${xpath_stars_text}    ${variable3}

func_180_check_broken_links
    ${ele}    Get WebElement    ${xpath_see_all_photos_link}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
    #Reference https://www.youtube.com/watch?v=sdPjmjikOxU
    ${items}=    SeleniumLibrary.Get Element Count    //div[@id='media_index_thumbnail_grid']/a
    log    ${items}
    @{LinkItems}    Create List
    FOR    ${INDEX}    IN RANGE    ${items}
        ${INDEX}=    Evaluate    ${INDEX}+1
        log    ${INDEX}
        ${href}=    SeleniumLibrary.Get Element Attribute    xpath=(//div[@id='media_index_thumbnail_grid']/a)[${INDEX}]    href
        log    link:${href}
        ${check_link_lenght}=    Get Length    ${href}
        ${check_start_with}=    Run Keyword And Ignore Error    Should Start With    ${href}    ${site_url}/
        ${check_without_hash}=    Run Keyword And Ignore Error    Should Not Contain    ${href}    \#
        Run Keyword If    ${check_link_lenght}>1 and '${check_start_with}[0]'=='PASS' and '${check_without_hash}[0]'=='PASS'    Append To List    ${LinkItems}    ${href}
    END
    Log List    ${LinkItems}
