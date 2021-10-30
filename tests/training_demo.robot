*** Settings ***
Documentation            Tests for Qentinel Pace Foundation training
Resource                     ../resources/keywords.robot
Resource                     ../resources/locators.robot

*** Test Cases ***
HomePage
    [Documentation]          Open a browser and open the link
    [Tags]                   BrowserOpen
    OpenBrowser              about:blank    ${BROWSER}
    GoTo                     ${URL}
    CloseAllBrowsers

Sign In
    [Documentation]          Open a browser, open the link, and login 
    [Tags]                   BrowserOpen
    OpenBrowser              about:blank    ${BROWSER}
    GoTo                     ${URL}
    ClickText                Sign in
    TypeText                 Email address    training.qentinel@gmail.com    Password
    TypeText                 Password         ${PASSWORD}
    ClickText                Sign in          Forgot your password?