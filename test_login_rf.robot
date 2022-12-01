*** Settings ***
Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[contains(text(),'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[1]/header/div/h6
${PLAYERSBUTTON}        xpath=//span[contains(text(),'Players')]
${ADDPLAYER BUTTON}     xpath=//span[text()='Add player']
${PLAYERNAME}       xpath=//input[@name='name']
${PLAYERSURNAME}        xpath=//input[@name='surname']
${PLAYERAGE}        xpath=//input[@name='age']
${PLAYERMAINPOSITION}       xpath=//input[@name='mainPosition']
${SUBMITNEWPLAYER}      xpath=//button[@type='submit']
${CHANGELANGUAGE PL}     xpath=//span[contains(text(), 'Polski')]
${CHANGELANGUAGE EN}     xpath=//span[contains(text(), 'English')]
${SIGNOUTBUTTON}        xpath=//span[contains(text(), 'Sign out')]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the submit button
    Assert dashboard
    Open Players page
    Add new player
    Change language
    Sign out
    [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open browser        ${LOGIN URL}        ${BROWSER}
    title should be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user01@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click on the submit button
    click element       ${SIGNINBUTTON}
Assert dashboard
    wait until element is visible  ${PAGELOGO}
    title should be  Scouts panel
    capture page screenshot  alert.png
Open Players page
    wait until element is visible       ${PAGELOGO}
    click element       ${PLAYERSBUTTON}
Add new player
    wait until element is visible       ${PAGELOGO}
    click element       ${ADDPLAYER BUTTON}
    input text      ${PLAYERNAME}       Test name
    input text      ${PLAYERSURNAME}        Test surname
    input text      ${PLAYERAGE}        10.08.1996
    input text      ${PLAYERMAINPOSITION}       Test
    click element       ${SUBMITNEWPLAYER}
    title should be  Add player
    sleep       10
Change language
    wait until element is visible       ${PAGELOGO}
    click element       ${CHANGELANGUAGE PL}
    sleep       10
Sign out
    wait until element is visible       ${PAGELOGO}
    click element       ${CHANGELANGUAGE EN}
    sleep       10
    click element     ${SIGNOUTBUTTON}