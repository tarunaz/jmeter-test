@MrlTraction @All @Duration @RO
Feature: Calculate MrlTraction Duration for RO
  Using BRMS rules, given the unit type cm-unit, and openings calculate the duration schedule

  Scenario Outline: Calculate MrlTraction Duration for RO
    Given a TKE unit type <unitType> for duration
    And the number of rear openings for duration is <rear>
    And the number of front openings for duration is <front>
    And the cmUnit for duration is <cmUnit>
    When the unit is processed for duration
    And duration PM is <pm>
    And duration CAT1 is <cat1>

    Examples: 
      | unitType  | cmUnit | front | rear | pm   | cat1 |
      #openings 2-6
      | EL-MR-001 | true   |     2 |      |  1.5 |    2 |
      | EL-MR-002 | true   |     5 |      |  1.5 |    2 |
      | EL-MR-003 | true   |     6 |      |  1.5 |    2 |
      #openings 7-15
      | EL-MR-004 | true   |     7 |      |    2 |    2 |
      | EL-MR-005 | true   |    10 |      |    2 |    2 |
      | EL-MR-006 | true   |    15 |      |    2 |    2 |
      #openings 16-∞
      | EL-MR-001 | true   |    16 |      | 1.25 |    2 |
      | EL-MR-002 | true   |    25 |      | 1.25 |    2 |
      | EL-MR-003 | true   |   100 |      | 1.25 |    2 |
      # Add .25 for rear
      #openings 2-6
      | EL-MR-001 | true   |     1 |    1 | 1.75 |    2 |
      | EL-MR-002 | true   |     2 |    3 | 1.75 |    2 |
      | EL-MR-003 | true   |     4 |    2 | 1.75 |    2 |
      #openings 7-15
      | EL-MR-004 | true   |     4 |    3 | 2.25 |    2 |
      | EL-MR-005 | true   |     5 |    5 | 2.25 |    2 |
      | EL-MR-006 | true   |     7 |    8 | 2.25 |    2 |
      #openings 16-∞
      | EL-MR-001 | true   |     8 |    8 |  1.5 |    2 |
      | EL-MR-002 | true   |    20 |    5 |  1.5 |    2 |
      | EL-MR-003 | true   |    10 |   90 |  1.5 |    2 |

  Scenario Outline: Calculate MrlTraction Duration with bi-parting for RO
    Given a TKE unit type <unitType> for duration
    And the number of rear openings for duration is <rear>
    And the number of front openings for duration is <front>
    And the cmUnit for duration is <cmUnit>
    And the bi-parting power door modifier is <biparting>
    When the unit is processed for duration
    And duration PM is <pm>
    And duration CAT1 is <cat1>

    Examples: 
      | unitType  | cmUnit | front | rear | biparting | pm   | cat1 |
      | EL-MR-001 | true   |     2 |      | true      |    2 |    2 |
      | EL-MR-002 | true   |     7 |      | true      | 3.75 |    2 |
      | EL-MR-003 | true   |    16 |      | true      | 3.25 |    2 |
