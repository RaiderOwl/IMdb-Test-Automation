*** Settings ***
Library    SeleniumLibrary
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
    scroll    ${xpath_honorary_awards_text}
    click_ele    ${xpath_circus_link}
    # click_ele    ${xpath_jazz_singer_link}
    #Değişkenlik gösterecek yer

func_140_get_series_info
    wait_ele_visible    ${xpath_director_text}    ${to}
    ${variable1}=    Get Text    ${xpath_director_text}
    ${variable2}=    Get Text    ${xpath_writer_text}
    ${variable3}=    Get Text    ${xpath_stars_text}
    Set Global Variable    ${variable1}
    Set Global Variable    ${variable2}
    Set Global Variable    ${variable3}
    Log To Console    Director:${variable1}
    Log To Console    Writer:${variable2}
    Log To Console    Stars:${variable3}

func_150_goto_home_page
    click_ele    ${xpath_home_button}

func_160_goto_series_page_with_search_bar
    wait_ele_visible    ${xpath_search_box}    ${to}
    input    ${xpath_search_box}    ${serie_1}
    # input    ${xpath_search_box}    ${serie_2}
    wait_and_click    ${xpath_the_circus_div}    ${to}
    # wait_and_click    ${xpath_jazz_singer_div}    ${to}
    #Değişkenlik gösterecek yer

func_170_check_series_info
    wait_ele_visible    ${xpath_director_text}    ${to}
    check_text    ${xpath_director_text}    ${variable1}
    check_text    ${xpath_writer_text}    ${variable2}
    check_text    ${xpath_stars_text}    ${variable3}

# func_110_menu_button
#     wait_and_click    ${xpath_menu_button}    ${to}
#     wait_and_click    ${xpath_oscars_link}    ${to}
#     wait_and_click    ${xpath_1929_link}    ${to}
#     scroll    ${xpath_honorary_awards_text}
#     click_ele    ${xpath_circus_link}
#     wait_ele_visible    ${xpath_director_text}    ${to}
#     ${variable1}=    get_str    ${xpath_director_text}
#     ${variable2}=    get_str    ${xpath_writer_text}
#     ${variable3}=    get_str    ${xpath_stars_text}
#     click_ele    ${xpath_home_button}
#     input    ${xpath_search_box}    ${serie_1}
#     wait_and_click    ${xpath_the_circus_div}    ${to}
#     check_text    ${xpath_director_text}    ${variable1}
#     check_text    ${xpath_writer_text}    ${variable2}
#     check_text    ${xpath_stars_text}    ${variable3}
#     scroll    ${xpath_see_all_photos_link}
#     click_ele    ${xpath_see_all_photos_link}
