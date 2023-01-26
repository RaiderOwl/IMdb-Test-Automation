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

Step 4: Pick a Series 1
    func_130_pick_series    ${xpath_circus_link}

Step 5: Get Series Information
    func_140_get_series_info

Step 6: Go To Home Page
    func_150_goto_home_page

Step 7: Go To Series 1 Page
    func_160_goto_series_page_with_search_bar    ${xpath_the_circus_div}    ${serie_1}

Step 8: Check Series Information
    func_170_check_series_info

Step 9: Check Broken Links
    func_180_check_broken_links

Step 10: Go To Home Page
    func_150_goto_home_page

Step 11:Goto Oscars Page
    func_110_goto_oscars_page

Step 12: Pick a Year
    func_120_pick_year

Step 13: Pick a Series 2
    func_130_pick_series    ${xpath_jazz_singer_link}

Step 14: Get Series Information
    func_140_get_series_info

Step 15: Go To Home Page
    func_150_goto_home_page

Step 16: Go To Series 2 Page
    func_160_goto_series_page_with_search_bar    ${xpath_jazz_singer_div}    ${serie_2}

Step 17: Check Series Information
    func_170_check_series_info

Step 18: Check Broken Links
    func_180_check_broken_links