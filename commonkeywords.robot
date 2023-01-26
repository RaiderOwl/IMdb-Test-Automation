*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Resource    shortcuts.robot
Resource    xpathvariables.robot

*** Keywords ***
#Open chrome browser and go to imbd site and maximize browser window
func_100_open_browser
    Open Browser    ${site_url}    ${browser}
    max_browser

#Click menu button and then click oscars link
func_110_goto_oscars_page
    wait_and_click    ${xpath_menu_button}    ${to}
    wait_and_click    ${xpath_oscars_link}    ${to}

#Click 1929 year link
func_120_pick_year
    wait_and_click    ${xpath_1929_link}    ${to}

#Scroll down the honorary awards text and click the given xpath locator
func_130_pick_series
    [Arguments]    ${xpath}
    scroll    ${xpath_honorary_awards_text}
    click_ele    ${xpath}

#Get Series Director, Writer and Stars Information and keep them in variables
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

#Click IMDB text for going home page
func_150_goto_home_page
    click_ele    ${xpath_home_button}

#Input given series name in a searchbox and then click given xpath locator
func_160_goto_series_page_with_search_bar
    [Arguments]    ${xpath}    ${series_name}
    wait_ele_visible    ${xpath_search_box}    ${to}
    input    ${xpath_search_box}    ${series_name}
    wait_and_click    ${xpath}    ${to}

#Checking Series Director, Writer and Stars Information is equal to our variables value
func_170_check_series_info
    wait_ele_visible    ${xpath_director_text}    ${to}
    check_text    ${xpath_director_text}    ${variable1}
    check_text    ${xpath_writer_text}    ${variable2}
    check_text    ${xpath_stars_text}    ${variable3}

#Get all /a items number in image div, Creating a List, Get length(int), start with https://www.imdb.com (boolean), not contains # (boolean) information.
# if link length is bigger than 1, start with our site link and not contain # link is add to our List Object.
#Finally checking our all /a items number and List Object number is equal or not, if it is not equal case is failure because there are missing or wrong link type
func_180_check_broken_links
    ${ele}    Get WebElement    ${xpath_see_all_photos_link}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
    #Reference https://www.youtube.com/watch?v=sdPjmjikOxU
    ${items}=    SeleniumLibrary.Get Element Count    //div[@id='media_index_thumbnail_grid']/a
    log    items number:${items}
    @{LinkItems}    Create List
    FOR    ${INDEX}    IN RANGE    ${items}
        ${INDEX}=    Evaluate    ${INDEX}+1
        ${href}=    SeleniumLibrary.Get Element Attribute    xpath=(//div[@id='media_index_thumbnail_grid']/a)[${INDEX}]    href
        ${check_link_lenght}=    Get Length    ${href}
        ${check_start_with}=    Run Keyword And Return Status    Should Start With    ${href}    ${site_url}/
        ${check_without_hash}=    Run Keyword And Return Status    Should Not Contain    ${href}    \#
        Run Keyword If    ${check_link_lenght}>1 and '${check_start_with}'=='True' and '${check_without_hash}'=='True'    Append To List    ${LinkItems}    ${href}
    END
    ${linkitems_lenght}=    Get Length    ${LinkItems}
    log    Link List number:${linkitems_lenght}
    IF    "${items}" != "${linkitems_lenght}"
        Fail    "There are some missing href attribute"
    END
    Log List    ${LinkItems}
