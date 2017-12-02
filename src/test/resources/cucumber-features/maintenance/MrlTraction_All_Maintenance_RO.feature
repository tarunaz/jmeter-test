@MrlTraction @All @Maintenance @RO
Feature: Calculate MrlTraction Maintenance for RO
  Using BRMS rules, given the unit type, cm-unit and openings calculate the maintenance schedule

  Scenario Outline: Calculate Hydraulic Maintenance for RO
    Given a TKE unit type <unitType> for maintenance
    And the number of rear openings is <rear>
    And the number of front openings is <front>
    And the cmUnit is <cmUnit>
    When the unit is processed for maintenance
    And PM is <pm>
    And CAT1 is <cat1>

    Examples: 
      | unitType  | cmUnit | rear | front | pm | cat1 |
      #openings 2-6
      | EL-MR-001 | true   |      |     2 |  5 |    1 |
      | EL-MR-002 | true   |      |     3 |  5 |    1 |
      | EL-MR-003 | true   |      |     6 |  5 |    1 |
      #openings 7-15
      | EL-MR-004 | true   |      |     7 |  5 |    1 |
      | EL-MR-005 | true   |      |    10 |  5 |    1 |
      | EL-MR-006 | true   |      |    15 |  5 |    1 |
      #openings 16-∞
      | EL-MR-004 | true   |      |    16 | 11 |    1 |
      | EL-MR-005 | true   |      |    19 | 11 |    1 |
      | EL-MR-006 | true   |      |   100 | 11 |    1 |
