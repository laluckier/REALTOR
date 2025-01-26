*** Settings ***
Resource    ../Settings/allresource.robot
Resource    ../Resources/Locators/Android/search.resource

*** Keywords ***
Search Residential Location
    [Documentation]    Owner: Pattamawan
    Click Element    ${txt_location_or_MLS}
    Input Text Into Current Element      ${search}
    Wait Until Element Is Visible        ${pnl_suggestions}        timeout=${Timeout}

Verify Suggestions Match Search Input
    [Documentation]    Owner: Pattamawan
    ${lenght}            Get Webelements    ${lst_search_match}
    ${count}             Get Length         ${lenght}
    ${status}            Evaluate           ${count}>0
    IF    ${status} == ${True}
        Log     "The search returned ${search} in the results for item ${count}.
    ELSE
        Fail    Search Not Found.
    END

Click On First Search Suggestion
    [Documentation]    Owner: Pattamawan
    Click Element                    ${lst_search_match}\[1]
    Wait Until Element Is Visible    ${lbl_result_listings}        timeout=${Timeout}