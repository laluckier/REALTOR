*** Settings ***
Resource         ../Settings/allresource.robot
Suite Setup      Open Application And Do Not Allow Permission
Test Teardown    Keyword Test Teardown


*** Test Cases ***
Open Application And Search Residential
    [Documentation]    Owner: Pattamawan
    [Tags]    search
    Search Residential Location
    Verify Suggestions Match Search Input
    Click On First Search Suggestion
    Filters For Residential
    Select First Residential Result
    Verify Residential Info Matches Search