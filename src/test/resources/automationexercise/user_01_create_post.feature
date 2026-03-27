Feature: Crear cuenta de usuario

  @post @user
  Scenario: Registrar un nuevo usuario con datos validos
    Given url baseUrl
    And path 'createAccount'
    And form field name           = 'Karate Test User'
    And form field email          = 'karatetest_alex@sofka.com'
    And form field password       = 'Test@1234'
    And form field title          = 'Mr'
    And form field birth_date     = '23'
    And form field birth_month    = '8'
    And form field birth_year     = '2001'
    And form field firstname      = 'Alexander'
    And form field lastname       = 'Molina'
    And form field company        = 'Sofka'
    And form field address1       = 'Calle 123'
    And form field address2       = 'Mansion 100'
    And form field country        = 'Uruguay'
    And form field zipcode        = '12345'
    And form field state          = 'Río Negro'
    And form field city           = 'Algorta'
    And form field mobile_number  = '1234567890'
    When method post
    Then status 200
    And match response.responseCode == 201
    And match response.message == 'User created!'
