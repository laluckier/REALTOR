*** Settings ***
Resource    ../Settings/allresource.robot
Resource    ../Resources/Locators/Android/filters.resource

*** Keywords ***
Filters For Residential
    [Documentation]    Owner: Pattamawan
    Wait Until Page Contains Element     ${btn_filters}             timeout=${Timeout}
    Click Element                        ${btn_filters}
    Wait Until Page Contains Element     ${mnu_residential}         timeout=${Timeout}
    Click Element                        ${mnu_residential}
    Click Element                        ${btn_for_sale}
    Select Max Price Range
    Select Number Of Bedrooms
    Select Property Type
    Check Total Results
    Click Element    ${btn_results}

Select ${range} Price Range
    [Documentation]    Owner: Pattamawan
    ...    Support action : Min, Max
    Click Element    ${ddl_price_${range}}
    Wait Until Element Is Visible    ${pnl_range_price}            timeout=${Timeout}
    ${found_element}    Set Variable    ${False}
    WHILE    ${found_element} == ${False}     limit=1m
        Swipe Down On Element    ${pnl_range_price}        timeout=${Timeout}
        ${found_element}    Run Keyword And Return Status
        ...    Wait Until Page Contains Element    ${lbl_selected_price}\[@content-desc="${${range}_price}"]    timeout=1s
    END
    Click Element    ${lbl_selected_price}\[@content-desc="${${range}_price}"]

Select Number Of Bedrooms
    [Documentation]    Owner: Pattamawan
    ${found_element}    Set Variable    ${False}
    WHILE    ${found_element} == ${False}     limit=${Timeout}
        Click Element    ${btn_increase_bedroom}
        ${num_of_room}              Get Text         ${lbl_number_of_bedroom}
        ${found_element}     Run Keyword And Return Status
        ...    Should Be Equal    ${bedroom}    ${num_of_room}
    END

Select Property Type
    [Documentation]    Owner: Pattamawan
    Click Element    ${lbl_property_type}
    Click Element    ${lbl_selected_property}

Check Total Results
    [Documentation]    Owner: Pattamawan
    Wait Until Page Contains Element             ${lbl_number_results}        timeout=${Timeout}
    ${results}           Get Text                ${lbl_number_results}
    ${num_of_results}    Remove String           ${results}        ${SPACE}Results
    Set Test Variable    ${NUM_OF_RESULTS}       ${num_of_results}