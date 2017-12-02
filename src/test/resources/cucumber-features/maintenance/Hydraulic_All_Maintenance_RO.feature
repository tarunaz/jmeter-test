@Hydraulic @All @Maintenance @RO
Feature: Calculate Hydraulic Maintenance for RO
  Using BRMS rules, given the unit type, cm-unit and openings calculate the maintenance schedule

  Scenario Outline: Calculate Hydraulic Maintenance for RO
    Given a TKE unit type <unitType> for maintenance
    And the number of rear openings is <rear>
    And the number of front openings is <front>
    And the cmUnit is <cmUnit>
    When the unit is processed for maintenance
    And PM is <pm>
    And PT is <pt>

    Examples: 
      | unitType  | cmUnit | rear | front | pm | pt |
      | EL-HY-001 | true   |    2 |       |  3 |  1 |
      | EL-HY-002 | true   |    3 |       |  3 |  1 |
      | EL-HY-003 | true   |    4 |       |  3 |  1 |
      | EL-HY-004 | true   |    5 |       |  5 |  1 |
      | EL-HY-005 | true   |    6 |       |  5 |  1 |
      | EL-HY-006 | true   |    7 |       |  6 |  1 |
      | EL-HY-007 | true   |    8 |       |  6 |  1 |
      #
      | EL-HY-001 | true   |    1 |     1 |  3 |  1 |
      | EL-HY-002 | true   |    1 |     2 |  3 |  1 |
      | EL-HY-003 | true   |    2 |     2 |  3 |  1 |
      | EL-HY-004 | true   |    3 |     2 |  5 |  1 |
      | EL-HY-005 | true   |    2 |     4 |  5 |  1 |
      | EL-HY-006 | true   |    5 |     2 |  6 |  1 |
      | EL-HY-007 | true   |    4 |     4 |  6 |  1 |
      #
      | EL-HY-001 | true   |      |     2 |  3 |  1 |
      | EL-HY-002 | true   |      |     3 |  3 |  1 |
      | EL-HY-003 | true   |      |     4 |  3 |  1 |
      | EL-HY-004 | true   |      |     5 |  5 |  1 |
      | EL-HY-005 | true   |      |     6 |  5 |  1 |
      | EL-HY-006 | true   |      |     7 |  6 |  1 |
      | EL-HY-007 | true   |      |     8 |  6 |  1 |
