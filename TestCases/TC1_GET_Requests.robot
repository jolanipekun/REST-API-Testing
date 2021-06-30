*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}    https://www.7timer.info
${product}   astro


*** Test Cases ***
Get_weatherInfo
    create session   mysession   ${base_url}
    ${response} = get request   mysession  /bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}


    #VALIDATIONS

    ${status_code} =  convert to string ${response.status_code}
    should be equal  ${status_code}    200

    ${body} =        convert to string  ${response.content}
    should contain    ${body}     astro

    ${contentTypeValue} = get from dictionary convert to string  ${response.headers}  Content-Length
    should be equal ${contentTypeValue}   476








