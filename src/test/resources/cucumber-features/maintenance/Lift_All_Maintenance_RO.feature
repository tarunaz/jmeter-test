@Dumbwaiter @All @Maintenance @RO
Feature: Calculate Maintenance with Item Type and Service Level
  Using BRMS rules, given the item type and service level
  figure out the maintenance for each of the different variation

  Scenario Outline: Calculate Maintenance using Item Type and Score for Dumbwaiter RO
    Given a TKE unit type <unitType> for maintenance
    And the cmUnit is <cmUnit>
    When the unit is processed for maintenance
    And PM is <pm>

    Examples: 
      | unitType  | cmUnit | pm |
      | EL-HL-001 | true   |  6 |
      | EL-HL-002 | true   |  6 |
      | EL-HL-003 | true   |  6 |
      | GE-UN-001 | true   |  6 |
      | IL-001    | true   |  6 |
      | PL-HY-001 | true   |  6 |
      | PL-TR-001 | true   |  6 |
      | ST-CH-001 | true   |  6 |
      | ST-PL-001 | true   |  6 |
