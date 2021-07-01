*** Settings ***
Library   JSONLibrary
Library   os
Library   Collections
Library   RequestsLibrary


*** Variables ***

${base_url}  https://restcountries.eu

*** Test Cases ***
Get_countryInfo
    create session    mysession      ${base_url}
    ${response} = get  request   mysession   /rest/v2/alpha/IN

    ${json_object} = to json  ${response.content}

    #Single data validation
    ${country_Name} =    get value from json   ${json_object}   $.name
    log to console   ${country_Name[0]}
    should be equal  ${country_Name[0]}     India


