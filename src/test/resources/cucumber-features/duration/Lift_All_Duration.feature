@Lift @All @Duration
Feature: Calculate Duration with Item Type and Service Level
  Using BRMS rules, given the item type, service level, usage, and location, 
  figure out the duration for each of the different variations

  Scenario Outline: Calculate duration using Item Type and Service Level
    Given a TKE unit type <unitType> for duration
    And the calculated service level for duration is <serviceLevel>
    When the unit is processed for duration
    Then duration IM is <im>

    Examples: 
      | unitType  | serviceLevel | im  |
      #Service Level 1
      | EL-HL-001 |            1 | 0.5 |
      | EL-HL-002 |            1 | 0.5 |
      | EL-HL-003 |            1 | 0.5 |
      | PL-HY-001 |            1 | 0.5 |
      | PL-TR-001 |            1 | 0.5 |
      | ST-CH-001 |            1 | 0.5 |
      | ST-PL-001 |            1 | 0.5 |
      | IL-001    |            1 | 0.5 |
      | GE-UN-001 |            1 | 0.5 |
