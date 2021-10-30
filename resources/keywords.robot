*** Settings ***
Documentation                    Reusable keywords and variables for Qentinel Pace Foundation training
Library                          QWeb
Library                          String

*** Variables ***
${BROWSER}                       chrome
${URL}                           http://automationpractice.com/

*** Keywords ***
Start Suite
    OpenBrowser                  about:blank    ${BROWSER}
    SetConfig                    SearchMode     draw

End Suite
    CloseAllBrowsers