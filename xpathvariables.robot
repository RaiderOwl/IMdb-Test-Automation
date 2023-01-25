*** Variables ***
#Globals
${site_url}    https://www.imdb.com/
${browser}    chrome
${to}    30
${serie_1}    The Circus
${serie_2}    The Jazz Singer

#Xpaths
${xpath_menu_button}    //*[@id="imdbHeader-navDrawerOpen"]
${xpath_oscars_link}    //*[@id="imdbHeader"]/div[2]/aside/div/div[2]/div/div[3]/span/div/div/ul/a[1]
${xpath_1929_link}    //*[@id="right-5-react"]/div/div[2]/div[16]/span[5]/a
${xpath_honorary_awards_text}    //*[@id="center-3-react"]/div/div/div[2]/div
${xpath_circus_link}    //*[@id="center-3-react"]/div/div/div[2]/h3/div/div/div//a[contains(text(),'${serie_1}')]
${xpath_jazz_singer_link}    //*[@id="center-3-react"]/div/div/div[2]/h3/div/div/div//a[contains(text(),'${serie_2}')]
${xpath_director_text}    //*[@id="__next"]/main/div/section[1]/section/div[3]/section/section/div[3]/div[2]/div[1]/div[3]/ul/li[1]/div/ul
${xpath_writer_text}    //*[@id="__next"]/main/div/section[1]/section/div[3]/section/section/div[3]/div[2]/div[1]/div[3]/ul/li[2]/div/ul
${xpath_stars_text}    //*[@id="__next"]/main/div/section[1]/section/div[3]/section/section/div[3]/div[2]/div[1]/div[3]/ul/li[3]/div/ul
${xpath_home_button}    //*[@id="home_img_holder"]
${xpath_search_box}    //*[@id="suggestion-search"]
# ${xpath_the_circus_div}    //*[@id="react-autowhatever-1--item-0"]/a/div[2]/div[1]
# ${xpath_jazz_singer_div}    //*[@id="react-autowhatever-1--item-0"]/a/div[2]/div[2]
${xpath_the_circus_div}    //*[@id="react-autowhatever-1--item-0"]/a/div[2]//div[contains(text(),'${serie_1}')]
${xpath_jazz_singer_div}    //*[@id="react-autowhatever-1--item-0"]/a/div[2]//div[contains(text(),'${serie_2}')]
${xpath_see_all_photos_link}    //*[@id="__next"]/main/div/section[1]/div/section/div/div[1]/section[2]/div[1]/div/a