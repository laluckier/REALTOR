*** Settings ***
Library         AppiumLibrary
Library         String
Variables       ../Settings/android_setting.yaml
Resource        ../Resources/Data/testdata.resource
Resource        ../Keywords/common.resource
Resource        ../Keywords/search.resource
Resource        ../Keywords/listing.resource
Resource        ../Keywords/filters.resource

*** Variables ***
${Lang}
${TestSite}
${Platform}     Android
${Timeout}      30s