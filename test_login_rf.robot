*** Settings ***
Library  SeleniumLibrary
Library    OperatingSystem
Library    Process
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}            https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                  Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}   xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[3]/div[1]/div/div[1]
${POLSKI}     xpath=//ul[2]/div[1]/div[2]/span
${ADDPLAYER}     xpath=//div[2]/div/div/a/button/span[1]
${ADDNAME}     xpath=//*[2]/div/div/input
${SURNAME}      xpath=//div[3]/div/div/input
${AGE}      xpath=//div[7]/div/div/input
${MAINPOSITION}     xpath=//div[11]/div/div/input
${SUBMITBUTTON}     xpath=//div[3]/button[1]
${LASTPLAYER}       xpath=//div[3]/div/div/a[1]/button/span[1]
${EDITPAGE}     xpath=//*/form/div[1]/div/span
${CREATEDPLAYER}    xpath=//ul[2]/div[1]/div[2]/span
${SIGNOUTBUT}       xpath=//ul[3]/div[2]/div[2]/span

*** Test Cases ***
Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser
Change language
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on Polski Button
    [Teardown]    Close Browser
Add Player
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on Add Player Button
    Assert Add Player
    Type in name
    Type in surname
    Type in age
    Type in position
    Click submit
    [Teardown]      Close Window
Last Created Player
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click at last player button
    Assert last player
    [Teardown]      Close Window
Add player for real
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on Add Player Button
    Assert Add Player
    Type in name
    Type in surname
    Type in age
    Type in position
    Click submit
    Assert RealPlayer
    [Teardown]      Close Window
Signing out from site
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click at last player button
    Assert last player
    Click signout
    [Teardown]      Close Window




*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Type in email
    Input Text    ${EMAILINPUT}    user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element    xpath=//*[(text()='Sign in')]
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    #Capture Element Screenshot    alert.png
Assert Add Player
    Wait Until Element Is Visible    ${ADDNAME}
Assert last player
    Wait Until Element Is Visible    ${EDITPAGE}
Assert RealPlayer
    Wait Until Element Contains    //*[@id="__next"]/div[2]    Added player
Click on Polski button
    Click element   ${Polski}
    Wait Until Element Contains    ${POLSKI}    English
Click on Add Player button
    Click Element    ${ADDPLAYER}
Type in name
    Input Text    ${ADDNAME}         Super
Type in surname
    Input Text    ${SURNAME}    Boss
Type in age
    Input Text    ${AGE}    02/14/2023
Type in position
    Input Text    ${MAINPOSITION}    Center
Click submit
    Click Element    ${SUBMITBUTTON}
Click at last player button
    Click Element       ${LASTPLAYER}
Click signout
    Click Element    ${SIGNOUTBUT}




