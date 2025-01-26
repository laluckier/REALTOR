*** Settings ***
Resource    ../Settings/allresource.robot
Resource    ../Resources/Locators/Android/common.resource

*** Keywords ***
Open Realtor Application
    [Documentation]    Owner: Pattamawan
    Open Application
            ...    remote_url=${Android.RemoteUrl}
            ...    platformName=${Android.PlatformName}
            ...    platformVersion=${Android.PlatformVersion}
            ...    deviceName=${Android.DeviceName}
            ...    appPackage=${Android.AppPackage}
            ...    appActivity=${Android.AppActivity}
            ...    noReset=${Android.NoReset}
            ...    automationName=${Android.AutomationName}
            ...    ignoreUnimportantViews=${True}
            ...    newCommandTimeout=10000

Click ${action} Access Devices Location
    [Documentation]    Owner: Pattamawan
    ...    Support action : While using the app, Only this time , Do Not Allow
    ${status}  Run Keyword And Return Status      Wait Until Element Is Visible          ${btn_permission_${action}}     timeout=${Timeout}
    IF    ${status} == ${True}        Click Element          ${btn_permission_${action}}

Click ${action} Location Setting
    [Documentation]    Owner: Pattamawan
    ...    Support action : Do Not Share, Change OS
    ${status}  Run Keyword And Return Status      Wait Until Element Is Visible          ${btn_permission_${action}}     timeout=${Timeout}
    IF    ${status} == ${True}        Click Element          ${btn_permission_${action}}

Close Cookies
    [Documentation]    Owner: Pattamawan
    ${status}  Run Keyword And Return Status      Wait Until Element Is Visible          ${btn_dismiss}     timeout=${Timeout}
    IF    ${status} == ${True}        Click Element          ${btn_dismiss}

Open Application And Do Not Allow Permission
    [Documentation]    Owner: Pattamawan
    Open Realtor Application
    Click Do Not Allow Access Devices Location
    Click Do Not Share Location Setting
    Close Cookies

Keyword Test Teardown
    [Documentation]    Owner: Pattamawan
    [Tags]    keyword_communicate
    Run Keyword If Test Passed      Capture Page Screenshot     pass.png
    Run Keyword If Test Failed      Capture Page Screenshot     fail.png
    Close All Applications

Swipe ${direction} Until Found Element
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${locator}    ${ratio_from_edge}=0.1    ${duration_time_swipe}=1000
    ${found_element}    Set Variable    ${False}
    WHILE    ${found_element} == ${False}     limit=${Timeout}
        Swipe ${direction} On Screen    ${ratio_from_edge}    ${duration_time_swipe}
        ${found_element}    Run Keyword And Return Status
        ...    Wait Until Page Contains Element    ${locator}    timeout=1s
    END

Swipe ${direction} On Screen
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${ratio_from_edge}=0.1    ${duration_time_swipe}=1000
    ${less_percent}       Evaluate    100 * ${ratio_from_edge}
    ${more_percent}       Evaluate    100 * (1-${ratio_from_edge})
    IF    "${direction.lower()}" == "up"
        ${adjust_point}     Evaluate              50
        Swipe By Percent    start_x=${adjust_point}    start_y=${less_percent}
        ...                 end_x=${adjust_point}      end_y=${more_percent}    duration=${duration_time_swipe}
    ELSE IF    "${direction.lower()}" == "down"
        ${adjust_point}     Evaluate              50
        Swipe By Percent    start_x=${adjust_point}    start_y=${more_percent}
        ...                 end_x=${adjust_point}      end_y=${less_percent}    duration=${duration_time_swipe}
    ELSE IF    "${direction.lower()}" == "left"
        ${adjust_point}     Evaluate              50
        Swipe By Percent    start_x=${less_percent}    start_y=${adjust_point}
        ...                 end_x=${more_percent}      end_y=${adjust_point}    duration=${duration_time_swipe}
    ELSE IF    "${direction.lower()}" == "right"
        ${adjust_point}     Evaluate              50
        Swipe By Percent    start_x=${more_percent}    start_y=${adjust_point}
        ...                 end_x=${less_percent}      end_y=${adjust_point}    duration=${duration_time_swipe}
    ELSE
        Fail    msg=Direction '${direction}' is not support on this keyword.
    END

Swipe ${direction} On Element
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${locator}    ${timeout}=${EMPTY}    ${ratio}=0.01    ${duration_time_swipe}=1000
    Wait Until Page Contains Element      ${locator}     timeout=${Timeout}
    ${top}    ${bottom}    ${left}    ${right}       Get Element Point     ${locator}    ${ratio}
    IF    "${direction.lower()}" == "up"
        ${center_vertical}      Evaluate    (${left}+${right}) / 2
        Swipe    ${center_vertical}    ${top}        ${center_vertical}    ${bottom}     duration=${duration_time_swipe}
    ELSE IF      "${direction.lower()}" == "down"
        ${center_vertical}      Evaluate    (${left}+${right}) / 2
        Swipe    ${center_vertical}    ${bottom}     ${center_vertical}    ${top}        duration=${duration_time_swipe}
    ELSE IF      "${direction.lower()}" == "left"
        ${center_horizontal}    Evaluate    (${top}+${bottom}) / 2
        Swipe    ${left}     ${center_horizontal}    ${right}    ${center_horizontal}    duration=${duration_time_swipe}
    ELSE IF      "${direction.lower()}" == "right"
        ${center_horizontal}    Evaluate    (${top}+${bottom}) / 2
        Swipe    ${right}    ${center_horizontal}    ${left}     ${center_horizontal}    duration=${duration_time_swipe}
    END

Get Element Point
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${locator}      ${ratio}
    ${element_location}            Get Element Location    ${locator}
    ${element_size}                Get Element Size        ${locator}
    ${ratio_vetical_element}       Evaluate                ${element_size}[height] * ${ratio}
    ${ratio_horizontal_element}    Evaluate                ${element_size}[width] * ${ratio}
    ${top}       Evaluate    ${element_location}[y] + ${ratio_vetical_element}
    ${bottom}    Evaluate    (${element_location}[y]+${element_size}[height]) - ${ratio_vetical_element}
    ${left}      Evaluate    ${element_location}[x] + ${ratio_horizontal_element}
    ${right}     Evaluate    (${element_location}[x]+${element_size}[width]) - ${ratio_horizontal_element}
    RETURN    ${top}    ${bottom}    ${left}    ${right}