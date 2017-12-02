@EscalatorMovingWalk @All @Duration @RO
Feature: Calculate Duration with Item Type and Service Level
  Using BRMS rules, given the item type, service level, usage, and location, 
  figure out the duration for each of the different variations

  Scenario Outline: Calculate duration using Item Type and Service Level
    Given a TKE unit type <unitType> for duration
    And the cmUnit for duration is <cmUnit>
    When the unit is processed for duration
    Then duration PM is <pm>
    Then duration CAT1 is <cat1>

    Examples: 
      | unitType  | cmUnit | pm | cat1 |
      | ES-ES-001 | true   |  2 |    2 |
      | ES-MW-001 | true   |  2 |    2 |
