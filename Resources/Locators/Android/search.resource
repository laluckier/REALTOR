*** Variables ***

${txt_location_or_MLS}                           //*[@resource-id="x:id/page.listings.search_textbox"]
${pnl_suggestions}                               //android.widget.ScrollView[@content-desc="x:id/page.property_search.search_suggestions"]
${lbl_search_near_your_location}                 //android.view.ViewGroup[@content-desc="Search near your current location"]
${lst_search_match}                              //android.widget.ScrollView[@content-desc="x:id/page.property_search.search_suggestions"]//android.view.ViewGroup[contains(@content-desc,"${search}")]
${lbl_result_listings}                           //android.widget.SeekBar//android.widget.TextView[@resource-id="x:id/page.listings.header.count.text"]
${pnl_list_residential}                          //android.view.ViewGroup[@resource-id="x:id/page.listings.listings.handle"]