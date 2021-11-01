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

Add product to shopping cart and cancel
    [Documentation]          User should add a product to shopping cart and cancel it
    [Tags]                   Shopping Cart  
    Appstate                 Sign In
    ClickText                DRESSES
    ClickText                Printed Dress
    ClickElement             ${icon_plus}
    DropDown                 Size             M
    ClickText                Add to cart
    VerifyText               Product successfully added to your shopping cart
    VerifyText               There are 2 items in your cart.
    ClickText                Proceed to checkout
    VerifyText               Size : M
    ClickItem                Delete
    VerifyText               Your shopping cart is empty.
    ClickItem                Return to Home
    VerifyNoItem             Return to Home
    ClickText                Sign out

Navigate to the Sign in page and create an account
    [Documentation]          Navigate to sign in page, create an account, don't register, and go back to home page
    [Tags]                   Create an account
    Appstate                 HomePage
    ClickText                Sign in
    TypeText                 Email address    rptest@gmail.com               Please enter your email address to create an account.
    ClickText                Create an account

