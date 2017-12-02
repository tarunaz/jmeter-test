@EscalatorMovingWalk @All @Maintenance @RO
Feature: Calculate Maintenance with Item Type and Service Level
  Using BRMS rules, given the item type and service level
  figure out the maintenance for each of the different variation

  Scenario Outline: Calculate Maintenance using Item Type and Score for Dumbwaiter RO
    Given a TKE unit type <unitType> for maintenance
    And the cmUnit is <cmUnit>
    When the unit is processed for maintenance
    And PM is <pm>
    And CAT1 is <cat1>

    Examples: 
      | unitType  | cmUnit | pm | cat1 |
      | ES-ES-001 | true   | 11 |    1 |
      | ES-MW-001 | true   | 11 |    1 |
