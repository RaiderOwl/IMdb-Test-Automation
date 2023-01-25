*** Settings ***
Resource    commonkeywords.robot
Resource    xpathvariables.robot

*** Test Cases ***
Step 1:Open Browser
    func_100_open_browser

Step 2:Goto Oscars Page
    func_110_goto_oscars_page

Step 3: Pick a Year
    func_120_pick_year

Step 4: Pick a Series
    func_130_pick_series

Step 5: Get Series Information
    func_140_get_series_info

Step 6: Go To Home Page
    func_150_goto_home_page

Step 7: Go To Series Page
    func_160_goto_series_page_with_search_bar

Step 8: Check Series Information
    func_170_check_series_info