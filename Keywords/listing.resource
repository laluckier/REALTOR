*** Settings ***
Resource    ../Settings/allresource.robot
Resource    ../Resources/Locators/Android/listing.resource

*** Keywords ***
Select First Residential Result
    [Documentation]    Owner: Pattamawan
    Check Search Results Displayed Correctly
    Click Element    ${pnl_first_residential}

Check Search Results Displayed Correctly
    [Documentation]    Owner: Pattamawan
    Wait Until Page Contains Element       ${lbl_result_listings}            timeout=${Timeout}
    ${results}            Get Text         ${lbl_result_listings}
    ${num_of_results}     Remove String    ${results}        ${SPACE}listings
    Should Be Equal As Numbers    ${num_of_results}    ${NUM_OF_RESULTS}

Verify Residential Info Matches Search
    [Documentation]    Owner: Pattamawan
    Wait Until Page Contains Element       ${lbl_residential_price}            timeout=${Timeout}
    Check Residential Price
    Check Residential Bedroom
    Swipe Down Until Found Element         ${btn_get_in_touch}
    Get Realtor Information

Check Residential Price
    [Documentation]    Owner: Pattamawan
    ${price}            Get Text           ${lbl_residential_price}
    ${num_of_price}     Remove String      ${price}    $
    ${actual_price}     Remove String      ${num_of_price}    ,
    ${search_price}     Remove String      ${max_price}    ,
    Should Be True      ${actual_price}<${search_price}

Check Residential Bedroom
    [Documentation]    Owner: Pattamawan
    ${bedrooms}           Get Text           ${lbl_residentail_bedroom}
    ${num_of_room}        Remove String      ${bedrooms}    ${SPACE}
    Should Contain Any    ${num_of_room}     ${bedroom}

Get Realtor Information
    [Documentation]    Owner: Pattamawan
    ${name}       Get Text    ${lbl_name_salesperson}
    Click Element             ${btn_get_in_touch}
    ${phone}      Get Text    ${lbl_phone_number}
    Log    Realtor is ${name}\n ${phone}