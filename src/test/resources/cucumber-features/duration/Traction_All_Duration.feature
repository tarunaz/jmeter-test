Feature: Calculate Duration with Item Type and Service Level
  Using BRMS rules, given the item type, service level, foreign equipment modifier, and
  freight door modifier, figure out the duration for each of the different variation

  @Traction @All @Duration
  Scenario Outline: Calculate duration using Item Type, Score, Foreign Equipment Modifier, and Freight Door Modifier for Traction
    Given a TKE unit type <unitType> for duration
    When the calculated service level for duration is <serviceLevel>
    And the foreign equipment modifier is <foreignEquipment>
    And the freight door modifier is <freightDoor>
    And the number of rear car doors is <rearDoor>
    And the unit is processed for duration
    Then duration PM/D is <pmd>
    And duration PM is <pm>
    And duration PM/MMR is <pmmmr>
    And duration IM is <im>
    And duration CAT1 is <cat1>

    # SL  PM/D   PM   PM/MMR   IM   CAT1
    # 1	  1      1    1.5      1    2
    # 2   1      1    1.5      1    2
    # 3   1      1.5  1.5      1    2
    # 4   1      2    1.5      1    2
    Examples: 
      | unitType  | serviceLevel | foreignEquipment | freightDoor | rearDoor | pmd | pm   | pmmmr | im | cat1 |
      # Service Level 1
      | EL-TR-001 |            1 | false            | false       |        5 |   1 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-002 |            1 | true             | false       |        0 |   1 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-003 |            1 | false            | true        |        1 |   1 |  1.5 |   1.5 |  1 |    2 |
      | EL-TR-001 |            1 | true             | true        |          |   1 |  1.5 |   1.5 |  1 |    2 |
      # Service Level 2
      | EL-TR-001 |            2 | false            | false       |          |   1 |    1 |   1.5 |  1 |    2 |
      | EL-TR-002 |            2 | true             | false       |        1 |   1 |  1.5 |   1.5 |  1 |    2 |
      | EL-TR-003 |            2 | false            | true        |        9 |   1 |  1.5 |   1.5 |  1 |    2 |
      | EL-TR-001 |            2 | true             | true        |        0 |   1 |  1.5 |   1.5 |  1 |    2 |
      # Service Level 3
      | EL-TR-001 |            3 | false            | false       |        2 |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-002 |            3 | true             | false       |          |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-003 |            3 | false            | true        |        0 |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-001 |            3 | true             | true        |        8 |   1 | 2.25 |   1.5 |  1 |    2 |
      # Service Level 4
      | EL-TR-001 |            4 | false            | false       |        1 |   1 | 2.25 |   1.5 |  1 |    2 |
      | EL-TR-002 |            4 | true             | false       |        0 |   1 | 2.25 |   1.5 |  1 |    2 |
      | EL-TR-003 |            4 | false            | true        |          |   1 | 2.25 |   1.5 |  1 |    2 |
      | EL-TR-001 |            4 | true             | true        |        9 |   1 | 2.75 |   1.5 |  1 |    2 |

  @Traction @All @Duration
  Scenario Outline: Calculate duration using biparting power, rear, and front doors
    Given a TKE unit type <unitType> for duration
    When the calculated service level for duration is <serviceLevel>
    And the foreign equipment modifier is <foreignEquipment>
    And the bi-parting power door modifier is <bipartingPowerDoor>
    And the number of front car doors is <frontDoor>
    And the number of rear car doors is <rearDoor>
    And the unit is processed for duration
    Then duration PM/D is <pmd>
    And duration PM is <pm>
    And duration PM/MMR is <pmmmr>
    And duration IM is <im>

    # SL  PM/D   PM   PM/MMR   IM   CAT1
    # 1	  1      1    1.5      1    2
    # 2   1      1    1.5      1    2
    # 3   1      1.5  1.5      1    2
    # 4   1      2    1.5      1    2
    Examples: 
      | unitType  | serviceLevel | foreignEquipment | bipartingPowerDoor | rearDoor | frontDoor | pmd | pm   | pmmmr | im | cat1 |
      # Tests rear doors and front doors - testing just the num of rear and front doors
      # no biparting power door
      # Service Level 1
      | EL-TR-001 |            1 | false            | false              |        1 |         2 |   1 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-002 |            1 | true             | false              |          |           |   1 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-003 |            1 | false            | false              |        0 |           |   1 |    1 |   1.5 |  1 |    2 |
      | EL-TR-001 |            1 | true             | false              |          |           |   1 | 1.25 |   1.5 |  1 |    2 |
      # Service Level 2
      | EL-TR-001 |            2 | false            | false              |        4 |           |   1 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-002 |            2 | true             | false              |        5 |         2 |   1 |  1.5 |   1.5 |  1 |    2 |
      | EL-TR-003 |            2 | false            | false              |          |           |   1 |    1 |   1.5 |  1 |    2 |
      | EL-TR-001 |            2 | true             | false              |        4 |           |   1 |  1.5 |   1.5 |  1 |    2 |
      # Service Level 3
      | EL-TR-001 |            3 | false            | false              |        3 |           |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-002 |            3 | true             | false              |          |         2 |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-003 |            3 | false            | false              |        2 |           |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-001 |            3 | true             | false              |          |           |   1 | 1.75 |   1.5 |  1 |    2 |
      # Service Level 4
      | EL-TR-001 |            4 | false            | false              |          |           |   1 |    2 |   1.5 |  1 |    2 |
      | EL-TR-002 |            4 | true             | false              |        2 |           |   1 |  2.5 |   1.5 |  1 |    2 |
      | EL-TR-003 |            4 | false            | false              |        3 |         2 |   1 | 2.25 |   1.5 |  1 |    2 |
      | EL-TR-001 |            4 | true             | false              |        0 |           |   1 | 2.25 |   1.5 |  1 |    2 |
      # with biparting power door
      # Service Level 1
      | EL-TR-001 |            1 | false            | true               |        1 |         5 |   2 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-002 |            1 | true             | true               |          |         4 |   2 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-003 |            1 | false            | true               |        0 |           |   1 |    1 |   1.5 |  1 |    2 |
      | EL-TR-001 |            1 | true             | true               |          |           |   1 | 1.25 |   1.5 |  1 |    2 |
      # Service Level 2
      | EL-TR-001 |            2 | false            | true               |        4 |         0 |   2 | 1.25 |   1.5 |  1 |    2 |
      | EL-TR-002 |            2 | true             | true               |        5 |           |   2 |  1.5 |   1.5 |  1 |    2 |
      | EL-TR-003 |            2 | false            | true               |          |           |   1 |    1 |   1.5 |  1 |    2 |
      | EL-TR-001 |            2 | true             | true               |        4 |           |   2 |  1.5 |   1.5 |  1 |    2 |
      # Service Level 3
      | EL-TR-001 |            3 | false            | true               |        3 |         6 |   2 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-002 |            3 | true             | true               |          |           |   1 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-003 |            3 | false            | true               |        2 |         6 |   2 | 1.75 |   1.5 |  1 |    2 |
      | EL-TR-001 |            3 | true             | true               |          |           |   1 | 1.75 |   1.5 |  1 |    2 |
      # Service Level 4
      | EL-TR-001 |            4 | false            | true               |          |         7 |   2 |    2 |   1.5 |  1 |    2 |
      | EL-TR-002 |            4 | true             | true               |        2 |           | 1.5 |  2.5 |   1.5 |  1 |    2 |
      | EL-TR-003 |            4 | false            | true               |        3 |         2 |   2 | 2.25 |   1.5 |  1 |    2 |
      | EL-TR-001 |            4 | true             | true               |        0 |           |   1 | 2.25 |   1.5 |  1 |    2 |
