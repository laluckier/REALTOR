*** Variables ***

# Allow to access device location?
${icn_permission}                                id=com.android.permissioncontroller:id/permission_icon
${lbl_permission_access_location}                //*[@resource-id="com.android.permissioncontroller:id/permission_message" and @text="Allow REALTOR.ca to access this device’s location?"]
${img_precise}                                   //*[@resource-id="com.android.permissioncontroller:id/permission_location_accuracy_radio_fine" and @text="Precise"]
${img_approximate}                               //*[@resource-id="com.android.permissioncontroller:id/permission_location_accuracy_radio_coarse" and @text="Approximate"]
${btn_permission_while_using_the_app}            //*[@resource-id="com.android.permissioncontroller:id/permission_allow_foreground_only_button" and @text="While using the app"]
${btn_permission_only_this_time}                 //*[@resource-id="com.android.permissioncontroller:id/permission_allow_one_time_button" and @text="Only this time"]
${btn_permission_do_not_allow}                   //*[@resource-id="com.android.permissioncontroller:id/permission_deny_button" and @text="Don’t allow"]

# Share Location
${lbl_location_unavailable}                      //android.view.ViewGroup[@content-desc="x:id/modal.content_box"]
${lbl_share_location_desc}                       //android.widget.TextView[@resource-id="x:id/modal.description"]
${btn_permission_do_not_share}                   //android.widget.Button[@content-desc="Don't share my location"]
${btn_permission_change_os}                      //android.widget.Button[@content-desc="Change OS location settings"]

# Home Pape
${btn_dismiss}                                   //android.widget.Button[@content-desc="Dismiss"]


