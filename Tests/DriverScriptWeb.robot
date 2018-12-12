*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/CommonFunctions.robot

*** Variables ***
${BROWSER} =  chrome
${URL} =  https://www.amazon.in
${REMOTE_URL} =  http://theitguy:f60f95e9-3ba5-4175-bc7a-1f5166385c6a@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES} =  name:Win 10 + Chrome 70, platform:Windows 10,browserName:chrome,version:70.0

#   robot -v REMOTE_URL:http://theitguy:f60f95e9-3ba5-4175-bc7a-1f5166385c6a@ondemand.saucelabs.com:80/wd/hub -d results/Win10Chrome71 -v DESIRED_CAPABILITIES:"name:Win 10 + Chrome 70, platform:Windows 10,browserName:chrome,version:71.0" Tests/DriverScriptWeb.robot
#   robot -v REMOTE_URL:http://theitguy:f60f95e9-3ba5-4175-bc7a-1f5166385c6a@ondemand.saucelabs.com:80/wd/hub -d results/Win10IE11 -v DESIRED_CAPABILITIES:"name:Win 10 + internet explorer 11, platform:Windows 10,browserName:internet explorer,version:11.285" Tests/DriverScriptWeb.robot
*** Test Cases ***
User Should Be Able To Open URL
    [Documentation]  This test case is to open the site
    [Tags]  Smoke
    Open Given URL

Validate The Web Page
    [Documentation]  This test case is to validate the open page
    [Tags]  Smoke
    Validate Page Opened

Close Browser After Validation
    [Documentation]  This test case closes all the open browsers
    Close Browsers


*** Keywords ***
Open Given URL
    [Documentation]  This Keyword Opens the browser and the url
    Open Browser  ${URL}  ${BROWSER}  #remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    wait until page contains  Your Amazon.in
    sleep  2s
    maximize browser window

Validate Page Opened
    [Documentation]  This keyword validate the opened page
    element text should be  id=nav-your-amazon  Your Amazon.in

Close Browsers
    [Documentation]  This keyword closes all the open browsers
    close all browsers