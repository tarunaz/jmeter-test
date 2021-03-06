@Dumbwaiter @All @Maintenance
Feature: Calculate Maintenance with Item Type and Service Level
  Using BRMS rules, given the item type and service level
  figure out the maintenance for each of the different variation

  Scenario Outline: Calculate Maintenance using Item Type and Score for Dumbwaiter
    Given a TKE unit type <unitType> for maintenance
    When the calculated service level is <serviceLevel>
    When the unit is processed for maintenance
    Then IM is <im>

    Examples: 
      | unitType  | serviceLevel | im |
      #Service Level 1
      | EL-DW-001 |            1 |  3 |
