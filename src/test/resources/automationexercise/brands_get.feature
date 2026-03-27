Feature: Obtener listado de marcas

  @get @smoke
  Scenario: Consultar todas las marcas disponibles
    Given url baseUrl
    And path 'brandsList'
    When method get
    Then status 200
    And match response.responseCode == 200
    And match response.brands == '#[]'
    And match response.brands[0] contains { id: '#number', brand: '#string' }
