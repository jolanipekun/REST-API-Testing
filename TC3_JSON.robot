*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections

*** Test Cases ***
Testcase1:
   ${json_obj} = load json from file  C:\jsonpractice\jsondata.json

   ${name_value} = get value from json  ${json_obj}   $.name
   should be equal  ${name_value[0]}  India


