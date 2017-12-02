@EscalatorMovingWalk @All @Maintenance
Feature: Calculate Maintenance with Item Type and Service Level
  Using BRMS rules, given the item type and service level,
  figure out the maintenance for each of the different variation

  Scenario Outline: Calculate Maintenance using Item Type, Score, and Openings for Escalator Moving Walk
    Given a TKE unit type <unitType> for maintenance
    When the calculated service level is <serviceLevel>
    When the unit is processed for maintenance
    And IM is <im>
    And IM/L is <imL>
    And PM is <pm>
    And PM/H is <pmH>
    And CAT1 is <cat1>

    Examples: 
      | unitType  | serviceLevel | im | imL | pm | pmH | cat1 |
      #Service Level 1
      | ES-ES-001 |            1 |  3 |   6 |  1 |   1 |    1 |
      | ES-MW-001 |            1 |  3 |   6 |  1 |   1 |    1 |
      #Service Level 2
      | ES-ES-001 |            2 |  0 |   8 |  1 |   2 |    1 |
      | ES-MW-001 |            2 |  0 |   8 |  1 |   2 |    1 |
