*** Settings ***
Documentation                Tests for Qentinel Pace Foundation training
Resource                     ../resources/keywords.robot
Resource                     ../resources/locators.robot
Library                      QWeb
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
    TypeText                 Email address                                    training.qentinel@gmail.com    Password
    TypeSecret               Password                                         ${PASSWORD}
    ClickText                Sign in                                          Forgot your password?

Add product to shopping cart and cancel
    [Documentation]          User should add a product to shopping cart and cancel it
    [Tags]                   Shopping Cart  
    Appstate                 Sign In
    ClickText                DRESSES
    ClickText                Printed Dress
    ClickElement             ${icon_plus}
    DropDown                 Size                                            M
    ClickText                Add to cart
    VerifyText               Product123 successfully added to your shopping cart
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
    TypeText                 Email address                                   rptest@gmail.com               Please enter your email address to create an account.
    ClickText                Create an account
    ClickElement             //*[@id\="id_gender1"]
    TypeText                 First name                                      rpai                           Mr.
    TypeText                 Last name                                       test
    TypeText                 Password                                        secret
    DropDown                 Date of Birth                                   9
    DropDown                 //*[@id\="months"]                              5 
    DropDown                 //*[@id\="years"]                               1996
    ClickCheckbox            Sign up for our newsletter!                     on
    ClickCheckbox            Receive special offers from our partners!       off
    TypeText                 Company                                         Copado
    TypeText                 Address                                         Street 1
    TypeText                 Address (Line 2)                                Main 2
    TypeText                 City                                            Udupi
    DropDown                 State                                           Texas
    TypeText                 Zip/Postal Code                                 donno
    DropDown                 Country                                         United States
    TypeText                 Additional information                          None
    TypeText                 Home phone                                      12345
    TypeText                 Mobile phone                                    67890
    TypeText                 Assign an address alias                         street2 Main2
    ClickItem                Return to Home
    #VerifyNoItem             Return to Home

Table Exercise
    [Documentation]          Open the table.html file stored under files folder and perform various commands
    [Tags]                   Open the table present in Browser
    OpenBrowser              file://${CURDIR}/../files/table.html            chrome
    
    # 1 - Focus on the table using *UseTable*
    UseTable                 Firstname

    #2 - Get the amount of rows in a table including headers
    ${rows}=                 GetTableRow                                     //last

    #3 - Get the amount of rows in table excluding headers
    ${rows}=                 GetTableRow                                     //last                        skip_header=True

    #4 - Find row index for row that contains text *Jane*. Do not include headers!
    ${rows}=                 GetTableRow                                     Jane                          skip_header=True

    #5 - Get the first name on third row.
    ${cell_value}=           GetCellText                                     r3c2

    #6 -Verify that the first name on second row is "Jane"
    VerifyTable              r2c2                                            Jane

    #7 - Click "Copy email" button in row that contains word "John"
    ClickCell                r?John/c4                                       tag=button   

