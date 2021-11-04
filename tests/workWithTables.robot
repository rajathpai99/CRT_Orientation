*** Settings ***
Documentation                Work with tables commands
Library                      QWeb

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