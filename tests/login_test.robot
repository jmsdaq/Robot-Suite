*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Variables ***
${BROWSER}           chrome
${LOGIN_URL}         https://www.saucedemo.com
${STANDARD_USER}     standard_user
${PASSWORD}          secret_sauce
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      id=login-button
${PRODUCT_PAGE}      id=inventory_container

*** Test Cases ***
User Can Log In Successfully
    [Documentation]    This test case verifies that a user can log in to the Sauce Labs demo site.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      ${USERNAME_FIELD}    ${STANDARD_USER}
    Input Text      ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${PRODUCT_PAGE}    timeout=5s
    Element Should Be Visible    ${PRODUCT_PAGE}
    Close Browser
