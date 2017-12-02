@Traction @All @Duration @RO
Feature: Calculate Traction Duration for RO
  Using BRMS rules, given the unit type cm-unit, and openings calculate the duration schedule

  Scenario Outline: Calculate Traction Duration for RO
    Given a TKE unit type <unitType> for duration
    And the number of rear openings for duration is <rear>
    And the number of front openings for duration is <front>
    And the cmUnit for duration is <cmUnit>
    When the unit is processed for duration
    And duration PM is <pm>
    And duration CAT1 is <cat1>

    Examples: 
      | unitType  | cmUnit | front | rear | pm   | cat1 |
      #openings 2-15
      | EL-TR-001 | true   |     2 |      |    2 |    2 |
      | EL-TR-002 | true   |     7 |      |    2 |    2 |
      | EL-TR-003 | true   |    15 |      |    2 |    2 |
      # openings 16-30
      | EL-TR-001 | true   |    16 |      |  2.5 |    2 |
      | EL-TR-002 | true   |    25 |      |  2.5 |    2 |
      | EL-TR-003 | true   |    30 |      |  2.5 |    2 |
      # openings 31-40
      | EL-TR-001 | true   |    31 |      |  1.5 |    2 |
      | EL-TR-002 | true   |    37 |      |  1.5 |    2 |
      | EL-TR-003 | true   |    40 |      |  1.5 |    2 |
      # openings 41-60
      | EL-TR-001 | true   |    41 |      |    2 |    2 |
      | EL-TR-002 | true   |    50 |      |    2 |    2 |
      | EL-TR-003 | true   |    60 |      |    2 |    2 |
      # openings 61-∞
      | EL-TR-001 | true   |    61 |      | 1.25 |    2 |
      | EL-TR-002 | true   |    70 |      | 1.25 |    2 |
      | EL-TR-003 | true   |   110 |      | 1.25 |    2 |
      # Rear car doors adds .25 to pm
      #openings 2-15
      | EL-TR-001 | true   |       |    2 | 2.25 |    2 |
      | EL-TR-002 | true   |       |    7 | 2.25 |    2 |
      | EL-TR-003 | true   |       |   15 | 2.25 |    2 |
      # openings 16-30
      | EL-TR-001 | true   |       |   16 | 2.75 |    2 |
      | EL-TR-002 | true   |       |   25 | 2.75 |    2 |
      | EL-TR-003 | true   |       |   30 | 2.75 |    2 |
      # openings 31-40
      | EL-TR-001 | true   |       |   31 | 1.75 |    2 |
      | EL-TR-002 | true   |       |   37 | 1.75 |    2 |
      | EL-TR-003 | true   |       |   40 | 1.75 |    2 |
      # openings 41-60
      | EL-TR-001 | true   |       |   41 | 2.25 |    2 |
      | EL-TR-002 | true   |       |   50 | 2.25 |    2 |
      | EL-TR-003 | true   |       |   60 | 2.25 |    2 |
      # openings 61-∞
      | EL-TR-001 | true   |       |   61 |  1.5 |    2 |
      | EL-TR-002 | true   |       |   70 |  1.5 |    2 |
      | EL-TR-003 | true   |       |  110 |  1.5 |    2 |

  Scenario Outline: Calculate Traction Duration with bi-parting for RO
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
      | EL-TR-001 | true   |     2 |      | true      |  2.5 |    2 |
      | EL-TR-002 | true   |     7 |      | true      | 3.75 |    2 |
      | EL-TR-003 | true   |    15 |      | true      |    4 |    2 |
      | EL-TR-001 | true   |     2 |      | false     |    2 |    2 |
      | EL-TR-002 | true   |     7 |      | false     |    2 |    2 |
      | EL-TR-003 | true   |    15 |      | false     |    2 |    2 |
