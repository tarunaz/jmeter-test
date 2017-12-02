@EscalatorMovingWalk @All @Duration
Feature: Calculate Duration with Item Type and Service Level
  Using BRMS rules, given the item type, service level, usage, and location, 
  figure out the duration for each of the different variations

  Scenario Outline: Calculate duration using Item Type, Service Level, Usage, and  Location
    Given a TKE unit type <unitType> for duration
    When the calculated service level for duration is <sl>
    When the unit is processed for duration
    And duration IM is <im>
    And duration IM/L is <imL>
    And duration PM is <pm>
    And duration PM/H is <pmH>
    And duration CAT1 is <cat1>

    Examples: 
      | unitType  | sl | im   | imL | pm | pmH | cat1 |
      #Service Level 1
      | ES-ES-001 |  1 | 0.75 |   1 |  4 |   1 |    4 |
      | ES-MW-001 |  1 | 0.75 |   1 |  4 |   1 |    4 |
      #Service Level 2
      | ES-ES-001 |  2 |    0 |   1 |  4 |   1 |    4 |
      | ES-MW-001 |  2 |    0 |   1 |  4 |   1 |    4 |
