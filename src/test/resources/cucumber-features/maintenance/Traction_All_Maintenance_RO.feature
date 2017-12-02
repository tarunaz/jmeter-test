@Traction @All @Maintenance @RO
Feature: Calculate Hydraulic Maintenance for RO
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
      #openings 2-15
      | EL-TR-001 | true   |    2 |       | 11 |    1 |
      | EL-TR-002 | true   |    7 |       | 11 |    1 |
      | EL-TR-003 | true   |   15 |       | 11 |    1 |
      # openings 16-30
      | EL-TR-001 | true   |   16 |       | 11 |    1 |
      | EL-TR-002 | true   |   25 |       | 11 |    1 |
      | EL-TR-003 | true   |   30 |       | 11 |    1 |
      # openings 31-40
      | EL-TR-001 | true   |   31 |       | 23 |    1 |
      | EL-TR-002 | true   |   37 |       | 23 |    1 |
      | EL-TR-003 | true   |   40 |       | 23 |    1 |
      # openings 41-60
      | EL-TR-001 | true   |   41 |       | 23 |    1 |
      | EL-TR-002 | true   |   50 |       | 23 |    1 |
      | EL-TR-003 | true   |   60 |       | 23 |    1 |
      # openings 61-∞
      | EL-TR-001 | true   |   61 |       | 51 |    1 |
      | EL-TR-002 | true   |   70 |       | 51 |    1 |
      | EL-TR-003 | true   |  110 |       | 51 |    1 |
      # Front Door Only
      #openings 2-15
      | EL-TR-001 | true   |      |     2 | 11 |    1 |
      | EL-TR-002 | true   |      |     7 | 11 |    1 |
      | EL-TR-003 | true   |      |    15 | 11 |    1 |
      # openings 16-30
      | EL-TR-001 | true   |      |    16 | 11 |    1 |
      | EL-TR-002 | true   |      |    25 | 11 |    1 |
      | EL-TR-003 | true   |      |    30 | 11 |    1 |
      # openings 31-40
      | EL-TR-001 | true   |      |    31 | 23 |    1 |
      | EL-TR-002 | true   |      |    37 | 23 |    1 |
      | EL-TR-003 | true   |      |    40 | 23 |    1 |
      # openings 41-60
      | EL-TR-001 | true   |      |    41 | 23 |    1 |
      | EL-TR-002 | true   |      |    50 | 23 |    1 |
      | EL-TR-003 | true   |      |    60 | 23 |    1 |
      # openings 61-∞
      | EL-TR-001 | true   |      |    61 | 51 |    1 |
      | EL-TR-002 | true   |      |    70 | 51 |    1 |
      | EL-TR-003 | true   |      |   110 | 51 |    1 |
      # Both Door Only
      #openings 2-15
      | EL-TR-001 | true   |    1 |     1 | 11 |    1 |
      | EL-TR-002 | true   |    3 |     4 | 11 |    1 |
      | EL-TR-003 | true   |    7 |     8 | 11 |    1 |
      # openings 16-30
      | EL-TR-001 | true   |    8 |     8 | 11 |    1 |
      | EL-TR-002 | true   |   15 |    10 | 11 |    1 |
      | EL-TR-003 | true   |   15 |    15 | 11 |    1 |
      # openings 31-40
      | EL-TR-001 | true   |   15 |    16 | 23 |    1 |
      | EL-TR-002 | true   |   27 |    10 | 23 |    1 |
      | EL-TR-003 | true   |   20 |    20 | 23 |    1 |
      # openings 41-60
      | EL-TR-001 | true   |   21 |    20 | 23 |    1 |
      | EL-TR-002 | true   |   25 |    25 | 23 |    1 |
      | EL-TR-003 | true   |   30 |    30 | 23 |    1 |
      # openings 61-∞
      | EL-TR-001 | true   |   31 |    30 | 51 |    1 |
      | EL-TR-002 | true   |   40 |    30 | 51 |    1 |
      | EL-TR-003 | true   |  100 |    10 | 51 |    1 |
