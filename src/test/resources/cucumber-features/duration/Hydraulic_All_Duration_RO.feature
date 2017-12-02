@Hydraulic @All @Duration @RO
Feature: Calculate Hydraulic Duration for RO
  Using BRMS rules, given the unit type cm-unit, and openings calculate the duration schedule

  Scenario Outline: Calculate Hydraulic Duration for RO
    Given a TKE unit type <unitType> for duration
    And the number of rear openings for duration is <rear>
    And the number of front openings for duration is <front>
    And the cmUnit for duration is <cmUnit>
    When the unit is processed for duration
    And duration PM is <pm>
    And duration PT is <pt>

    Examples: 
      | unitType  | rear | front | cmUnit | pm   | pt |
      | EL-HY-001 |      |     2 | true   | 0.75 |  1 |
      | EL-HY-002 |      |     3 | true   | 0.75 |  1 |
      | EL-HY-003 |      |     4 | true   | 0.75 |  1 |
      | EL-HY-004 |      |     5 | true   | 0.75 |  1 |
      | EL-HY-005 |      |     6 | true   | 0.75 |  1 |
      | EL-HY-006 |      |     7 | true   |    1 |  1 |
      | EL-HY-007 |      |     8 | true   |    1 |  1 |
      # Add .25 to pm for rear doors
      | EL-HY-001 |    2 |       | true   |    1 |  1 |
      | EL-HY-002 |    3 |       | true   |    1 |  1 |
      | EL-HY-003 |    4 |       | true   |    1 |  1 |
      | EL-HY-004 |    5 |       | true   |    1 |  1 |
      | EL-HY-005 |    6 |       | true   |    1 |  1 |
      | EL-HY-006 |    7 |       | true   | 1.25 |  1 |
      | EL-HY-007 |    8 |       | true   | 1.25 |  1 |
      # Add .25 to pm for rear doors
      | EL-HY-001 |    1 |     1 | true   |    1 |  1 |
      | EL-HY-002 |    1 |     2 | true   |    1 |  1 |
      | EL-HY-003 |    3 |     1 | true   |    1 |  1 |
      | EL-HY-004 |    2 |     3 | true   |    1 |  1 |
      | EL-HY-005 |    4 |     2 | true   |    1 |  1 |
      | EL-HY-006 |    5 |     2 | true   | 1.25 |  1 |
      | EL-HY-007 |    3 |     5 | true   | 1.25 |  1 |

  Scenario Outline: Calculate Hydraulic Duration with bi-parting for RO
    Given a TKE unit type <unitType> for duration
    And the number of rear openings for duration is <rear>
    And the number of front openings for duration is <front>
    And the cmUnit for duration is <cmUnit>
    And the bi-parting power door modifier is <biparting>
    When the unit is processed for duration
    And duration PM is <pm>
    And duration PT is <pt>

    Examples: 
      | unitType  | rear | front | cmUnit | biparting | pm   | pt |
      | EL-HY-001 |      |     2 | true   | true      | 1.25 |  1 |
      | EL-HY-002 |      |     3 | true   | true      |  1.5 |  1 |
      | EL-HY-003 |      |     4 | true   | true      | 1.75 |  1 |
      | EL-HY-004 |      |     5 | true   | true      |    2 |  1 |
      | EL-HY-005 |      |     6 | true   | true      | 2.25 |  1 |
      | EL-HY-006 |      |     7 | true   | true      | 2.75 |  1 |
      | EL-HY-007 |      |     8 | true   | true      |    3 |  1 |
      | EL-HY-007 |      |    10 | true   | true      |    3 |  1 |
      # Add .25 to pm for rear doors and .25 * total
      | EL-HY-001 |    2 |       | true   | true      |  1.5 |  1 |
      | EL-HY-002 |    3 |       | true   | true      | 1.75 |  1 |
      | EL-HY-003 |    4 |       | true   | true      |    2 |  1 |
      | EL-HY-004 |    5 |       | true   | true      | 2.25 |  1 |
      | EL-HY-005 |    6 |       | true   | true      |  2.5 |  1 |
      | EL-HY-006 |    7 |       | true   | true      |    3 |  1 |
      | EL-HY-007 |    8 |       | true   | true      | 3.25 |  1 |
      # Add .25 to pm for rear doors and .25 * total
      | EL-HY-001 |    1 |     1 | true   | true      |  1.5 |  1 |
      | EL-HY-002 |    1 |     2 | true   | true      | 1.75 |  1 |
      | EL-HY-003 |    3 |     1 | true   | true      |    2 |  1 |
      | EL-HY-004 |    2 |     3 | true   | true      | 2.25 |  1 |
      | EL-HY-005 |    4 |     2 | true   | true      |  2.5 |  1 |
      | EL-HY-006 |    5 |     2 | true   | true      |    3 |  1 |
      | EL-HY-007 |    3 |     5 | true   | true      | 3.25 |  1 |
      # Add .25 to pm for rear doors and max 2
      # > 7 = 1
      # rear= .25
      # biparting+ >=8 = 2
      # total = 3.25
      | EL-HY-001 |    1 |    10 | true   | true      | 3.25 |  1 |
      | EL-HY-002 |    1 |    20 | true   | true      | 3.25 |  1 |
      | EL-HY-003 |    3 |    10 | true   | true      | 3.25 |  1 |
      | EL-HY-004 |   20 |     3 | true   | true      | 3.25 |  1 |
      | EL-HY-005 |   40 |     2 | true   | true      | 3.25 |  1 |
      | EL-HY-006 |   50 |     2 | true   | true      | 3.25 |  1 |
      | EL-HY-007 |   30 |     5 | true   | true      | 3.25 |  1 |
