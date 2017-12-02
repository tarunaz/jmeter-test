@Hydraulic @All @Duration
Feature: Calculate Duration with Item Type and Service Level
  Using BRMS rules, given the item type, service level, foreign equipment modifier, and
  bi-parting power door modifier, figure out the duration for each of the different variation

  Scenario Outline: Calculate duration using Item Type, Score, foreign equipment modifier, and bi-parting power door modifier for Hydraulic
    Given a TKE unit type <unitType> for duration
    When the calculated service level for duration is <serviceLevel>
    And the foreign equipment modifier is <foreignEquipment>
    And the bi-parting power door modifier is <bipartingPowerDoor>
    And the number of front car doors is <frontDoor>
    And the number of rear car doors is <rearDoor>
    And the unit is processed for duration
    Then duration PM/D is <pmd>
    And duration PM is <pm>
    And duration IM is <im>
    And duration PT is <pt>

    # S  PM/D PM     IM	   PT
    # 1  1    1      0.5    1
    # 2  1    1.5    0.5    1
    # 3  1    2      0.5    1
    # 4  1    2.5    0.5    1
    Examples: 
      | unitType  | serviceLevel | foreignEquipment | bipartingPowerDoor | frontDoor | rearDoor | pmd  | pm   | im  | pt |
      # Service Level 1
      | EL-HY-001 |            1 | false            | false              |           |        3 |    1 | 1.25 | 0.5 |  1 |
      | EL-HY-002 |            1 | true             | false              |           |        0 |    1 | 1.25 | 0.5 |  1 |
      | EL-HY-003 |            1 | false            | true               |           |          |    1 | 1.25 | 0.5 |  1 |
      | EL-HY-004 |            1 | true             | true               |           |        6 |    2 | 1.75 | 0.5 |  1 |
      # Service Level 2
      | EL-HY-001 |            2 | false            | false              |           |        5 |    1 | 1.75 | 0.5 |  1 |
      | EL-HY-002 |            2 | true             | false              |           |        0 |    1 | 1.75 | 0.5 |  1 |
      | EL-HY-003 |            2 | false            | true               |           |        7 |    2 |    2 | 0.5 |  1 |
      | EL-HY-004 |            2 | true             | true               |           |          |    1 |    2 | 0.5 |  1 |
      # Service Level 3
      | EL-HY-001 |            3 | false            | false              |           |          |    1 |    2 | 0.5 |  1 |
      | EL-HY-002 |            3 | true             | false              |           |        4 |    1 |  2.5 | 0.5 |  1 |
      | EL-HY-003 |            3 | false            | true               |           |        0 |    1 | 2.25 | 0.5 |  1 |
      | EL-HY-004 |            3 | true             | true               |           |        5 |    2 | 2.75 | 0.5 |  1 |
      # Service Level 4
      | EL-HY-001 |            4 | false            | false              |           |        1 |    1 | 2.75 | 0.5 |  1 |
      | EL-HY-002 |            4 | true             | false              |           |        0 |    1 | 2.75 | 0.5 |  1 |
      | EL-HY-003 |            4 | false            | true               |           |          |    1 | 2.75 | 0.5 |  1 |
      | EL-HY-004 |            4 | true             | true               |           |        9 |    2 | 3.25 | 0.5 |  1 |
      # Tests rear doors and front doors - testing just the num of rear and front doors
      # no biparting power door
      # Service Level 1
      | EL-HY-001 |            1 | false            | false              |         1 |        3 |    1 | 1.25 | 0.5 |  1 |
      | EL-HY-002 |            1 | false            | false              |         1 |        2 |    1 | 1.25 | 0.5 |  1 |
      | EL-HY-003 |            1 | false            | false              |         1 |          |    1 |    1 | 0.5 |  1 |
      | EL-HY-004 |            1 | false            | false              |         1 |        6 |    1 | 1.25 | 0.5 |  1 |
      # Service Level 2
      | EL-HY-001 |            2 | false            | false              |         1 |        3 |    1 | 1.75 | 0.5 |  1 |
      | EL-HY-002 |            2 | false            | false              |         1 |        2 |    1 | 1.75 | 0.5 |  1 |
      | EL-HY-003 |            2 | false            | false              |         1 |          |    1 |  1.5 | 0.5 |  1 |
      | EL-HY-004 |            2 | false            | false              |         1 |        6 |    1 | 1.75 | 0.5 |  1 |
      # Service Level 3
      | EL-HY-001 |            3 | false            | false              |         1 |        3 |    1 | 2.25 | 0.5 |  1 |
      | EL-HY-002 |            3 | false            | false              |         1 |        2 |    1 | 2.25 | 0.5 |  1 |
      | EL-HY-003 |            3 | false            | false              |         1 |          |    1 |    2 | 0.5 |  1 |
      | EL-HY-004 |            3 | false            | false              |         1 |        6 |    1 | 2.25 | 0.5 |  1 |
      # Service Level 4
      | EL-HY-001 |            4 | false            | false              |         1 |        3 |    1 | 2.75 | 0.5 |  1 |
      | EL-HY-002 |            4 | false            | false              |         1 |        2 |    1 | 2.75 | 0.5 |  1 |
      | EL-HY-003 |            4 | false            | false              |         1 |          |    1 |  2.5 | 0.5 |  1 |
      | EL-HY-004 |            4 | false            | false              |         1 |        6 |    1 | 2.75 | 0.5 |  1 |
      # with biparting power door
      # Service Level 1
      | EL-HY-001 |            1 | false            | true               |         1 |        3 |    2 |  1.5 | 0.5 |  1 |
      | EL-HY-002 |            1 | false            | true               |         1 |        2 | 1.75 |  1.5 | 0.5 |  1 |
      | EL-HY-003 |            1 | false            | true               |         1 |          | 1.25 | 1.25 | 0.5 |  1 |
      | EL-HY-004 |            1 | false            | true               |         1 |        6 |    2 |  1.5 | 0.5 |  1 |
      # Service Level 2
      | EL-HY-001 |            2 | false            | true               |         1 |        3 |    2 |    2 | 0.5 |  1 |
      | EL-HY-002 |            2 | false            | true               |         1 |        2 | 1.75 |    2 | 0.5 |  1 |
      | EL-HY-003 |            2 | false            | true               |         1 |          | 1.25 | 1.75 | 0.5 |  1 |
      | EL-HY-004 |            2 | false            | true               |         1 |        6 |    2 |    2 | 0.5 |  1 |
      # Service Level 3
      | EL-HY-001 |            3 | false            | true               |         1 |        3 |    2 |  2.5 | 0.5 |  1 |
      | EL-HY-002 |            3 | false            | true               |         1 |        2 | 1.75 |  2.5 | 0.5 |  1 |
      | EL-HY-003 |            3 | false            | true               |         1 |          | 1.25 | 2.25 | 0.5 |  1 |
      | EL-HY-004 |            3 | false            | true               |         1 |        6 |    2 |  2.5 | 0.5 |  1 |
      # Service Level 4
      | EL-HY-001 |            4 | false            | true               |         1 |        3 |    2 |    3 | 0.5 |  1 |
      | EL-HY-002 |            4 | false            | true               |         1 |        2 | 1.75 |    3 | 0.5 |  1 |
      | EL-HY-003 |            4 | false            | true               |         1 |          | 1.25 | 2.75 | 0.5 |  1 |
      | EL-HY-004 |            4 | false            | true               |         1 |        6 |    2 |    3 | 0.5 |  1 |
