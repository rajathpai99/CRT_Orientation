*** Settings ***
Documentation                Tests for Qentinel Pace Foundation training
Resource                     ../resources/keywords.robot
Resource                     ../resources/locators.robot
Suite Setup                  Start Suite
Suite Teardown               End Suite

*** Test Cases ***
HomePage
    [Documentation]          Open a browser and open the link
    [Tags]                   BrowserOpen
    GoTo                     ${URL}

Sign In
    [Documentation]          Open a browser, open the link, and login 
    [Tags]                   BrowserOpen
    GoTo                     ${URL}
    ClickText                Sign in
    TypeText                 Email address    training.qentinel@gmail.com    Password
    TypeSecret               Password         ${PASSWORD}
    ClickText                Sign in          Forgot your password?