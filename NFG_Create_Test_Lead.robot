*** Settings ***
Library     Selenium2Library
Library     ScreenCapLibrary
Library     Screenshot
Library     DateTime
Library     RPA.Browser.Selenium
Library     FlaUILibrary

Suite Setup     Selenium2Library.Open Browser    ${URL}   ${BROWSER}
Suite Teardown  Selenium2Library.Close All Browsers

*** Variables ***
${URL}     https://ngstg-myportal.nfiniti.ai/
${BROWSER}      Chrome
${input_username}      //input[@id='username']
${input_pwd}     //input[@id='password']
${myportal_username}      smanager
${myportal_pwd}      Admin@123
${sm_logo}  //SPAN[text()='SM']
${myportal_signin}  //SPAN[@type='button'][text()='Sign in']
${myportal_signout}     //BUTTON[@type='button'][text()='Log Out']


*** Test Cases ***
Create Lead
    #start video recording
    ${dateTwo} =   DateTime.Get Current Date   exclude_millis=no
    ${Global_Variable} =   DateTime.Convert Date   ${dateTwo}    result_format=%Y%m%d_%H%M%S
    Log   ${Global_Variable}    console=yes
    Selenium2Library.Maximize Browser Window
    Selenium2Library.capture page screenshot    EMBED
    Selenium2Library.Wait Until Element Is Visible  //h2[normalize-space()='Welcome']    15
    Selenium2Library.Input Text      ${input_username}  ${myportal_username}
    Selenium2Library.Input Text      ${input_pwd}  ${myportal_pwd}
    Selenium2Library.Wait Until Element Is Visible  ${myportal_signin}
    Selenium2Library.Click Element   ${myportal_signin}
    Selenium2Library.Wait Until Element Is Visible  ${sm_logo}
    Selenium2Library.capture page screenshot    EMBED
    Selenium2Library.Wait Until Element Is Visible    //DIV[@class='cardTitle'][text()='Prospecting Tracker']   15
    Selenium2Library.Click Element   //DIV[@class='cardTitle'][text()='Prospecting Tracker']
    BuiltIn.sleep   5s
    ${WindowHandles}    Selenium2Library.get window handles
    Selenium2Library.Switch Window    ${WindowHandles}[1]
    BuiltIn.sleep   5s
    #Selenium2Library.Wait Until Element Is Visible    //*[contains(text(),'Create New Lead')]   15
    Selenium2Library.Click Element   //BUTTON[@type='button'][text()='Create New Lead']
    BuiltIn.sleep   5s
    Selenium2Library.capture page screenshot    EMBED
    Selenium2Library.Switch Window    ${WindowHandles}[1]
    Selenium2Library.Wait Until Element Is Visible    //INPUT[@name='firstName']   15
    Selenium2Library.Input Text   //INPUT[@name='firstName']    Elan
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='lastName']    Panneer
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='title']    CEO
    BuiltIn.sleep   3s
    Selenium2Library.Click Element  (//div[contains(@class, 'react-datepicker__input-container')])[1]
    BuiltIn.sleep   3s
    Selenium2Library.press keys    None     07051982
    BuiltIn.sleep   3s
    Selenium2Library.Press Keys  None  ENTER
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='contactStreetAddress']    Test only ${Global_Variable}
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='contactCity']    Chicago
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   (//SELECT[@id='state'])[1]
    BuiltIn.sleep   3s
    Selenium2Library.select from list by value    (//SELECT[@id='state'])[1]     NJ
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='contactZipCode']    55555
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='email']    testauro001@jorrapide.com
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   (//SELECT[@id='state'])[2]
    BuiltIn.sleep   3s
    Selenium2Library.select from list by value    (//SELECT[@id='state'])[2]     home
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@class='form-control ']    6308903471
    BuiltIn.sleep   3s
    Selenium2Library.Press Keys  None  ENTER
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   (//SELECT[@id='state'])[3]
    BuiltIn.sleep   3s
    Selenium2Library.select from list by value    (//SELECT[@id='state'])[3]     mobile
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='businessName']    ProdBase ${Global_Variable}
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='businessStreetAddress']    Test only ${Global_Variable}
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='businessCity']    ABZ
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   (//SELECT[@id='state'])[4]
    BuiltIn.sleep   3s
    Selenium2Library.select from list by value    (//SELECT[@id='state'])[4]     TX
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='businessZipCode']    55555
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   (//SELECT[@id='state'])[5]
    BuiltIn.sleep   3s
    Selenium2Library.select from list by value    (//SELECT[@id='state'])[5]     Commercial Loan
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='account']    Washington
    BuiltIn.sleep   3s
    Selenium2Library.Input Text   //INPUT[@name='estimatedValue']    88889
    BuiltIn.sleep   3s
    Selenium2Library.Click Element  (//div[contains(@class, 'react-datepicker__input-container')])[2]
    BuiltIn.sleep   3s
    Selenium2Library.press keys    None     09042024
    BuiltIn.sleep   3s
    Selenium2Library.Press Keys  None  ENTER
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   //BUTTON[@type='button'][text()='25 %']
    BuiltIn.sleep   3s
    Selenium2Library.Click Element   //button[text()='Create Lead']
    BuiltIn.sleep   3s
    Selenium2Library.capture page screenshot    EMBED
    #Selenium2Library.Switch Window    ${WindowHandles}[1]
    BuiltIn.sleep   5s
    #Selenium2Library.Wait Until Element Is Visible    //*[@Name='No']   15
    Selenium2Library.capture page screenshot    EMBED
    ${WindowHandles}    Selenium2Library.get window handles
    Selenium2Library.Switch Window    ${WindowHandles}[1]
    BuiltIn.sleep   5s
    Selenium2Library.Click Element   //BUTTON[@type='button'][text()='No']
    Selenium2Library.Wait Until Element Is Visible  ${sm_logo}
    Selenium2Library.capture page screenshot    EMBED
    Selenium2Library.Click Element    ${sm_logo}
    Selenium2Library.Wait Until Element Is Visible  ${myportal_signout}
    Selenium2Library.capture page screenshot    EMBED
    Selenium2Library.Click Element    ${myportal_signout}
    #stop video recording





