@Lift @All @Maintenance
Feature: Calculate Maintenance with Item Type and Service Level
  Using BRMS rules, given the item type and service level
  figure out the maintenance for each of the different variation

  Scenario Outline: Calculate Maintenance using Item Type and Score for Lift
    Given a TKE unit type <unitType> for maintenance
    When the calculated service level is <serviceLevel>
    When the unit is processed for maintenance
    Then IM is <im>

    Examples: 
      | unitType  | serviceLevel | im |
      #Service Level 1
      | EL-HL-001 |            1 |  2 |
      | EL-HL-002 |            1 |  2 |
      | EL-HL-003 |            1 |  2 |
      | PL-HY-001 |            1 |  2 |
      | PL-TR-001 |            1 |  2 |
      | ST-CH-001 |            1 |  2 |
      | ST-PL-001 |            1 |  2 |
      | IL-001    |            1 |  2 |
      | GE-UN-001 |            1 |  2 |
