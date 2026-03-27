Feature: Actualizar cuenta de usuario

  @put @user
  Scenario: Actualizar datos de un usuario existente
    Given url baseUrl
    And path 'updateAccount'
    And form field name           = 'Karate Test User Updated'
    And form field email          = 'karatetest_alex@sofka.com'
    And form field password       = 'Test@1234'
    And form field title          = 'Mr'
    And form field birth_date     = '24'
    And form field birth_month    = '9'
    And form field birth_year     = '2000'
    And form field firstname      = 'Alexander David'
    And form field lastname       = 'Molina Rieger'
    And form field company        = 'Sofka Technologies'
    And form field address1       = 'Tremenda Calle 123'
    And form field address2       = 'Piso 2'
    And form field country        = 'Uruguay'
    And form field zipcode        = '54321'
    And form field state          = 'Paysandu'
    And form field city           = 'Paysandu'
    And form field mobile_number  = '0987654321'
    When method put
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'User updated!'
