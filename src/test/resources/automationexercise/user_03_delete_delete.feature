Feature: Eliminar cuenta de usuario

  @delete @user
  Scenario: Eliminar usuario existente con credenciales validas
    Given url baseUrl
    And path 'deleteAccount'
    And form field email    = 'karatetest_alex@sofka.com'
    And form field password = 'Test@1234'
    When method delete
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'Account deleted!'
