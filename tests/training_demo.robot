*** Settings ***
Documentation            Tests for Qentinel Pace Foundation training
Resource                     ../resources/keywords.robot
Resource                     ../resources/locators.robot

*** Test Cases ***
    [Documentation]          Open a browser and open the link
    [Tags]                   BrowserOpen
    OpenBrowser              about:blank    ${BROWSER}
    GoTo                     ${URL}
    CloseAllBrowsers