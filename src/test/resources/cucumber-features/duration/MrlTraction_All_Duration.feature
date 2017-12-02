@MrlTraction @All @Duration
Feature: Calculate Duration with Item Type and Service Level
  Using BRMS rules, given the item type, service level, foreign equipment modifier, and
  freight door modifier, figure out the duration for each of the different variation

  Scenario Outline: Calculate duration using Item Type, Score, Foreign Equipment Modifier, and Freight Door Modifier for mrl Traction
    Given a TKE unit type <unitType> for duration
    When the calculated service level for duration is <serviceLevel>
    And the foreign equipment modifier is <foreignEquipment>
    And the bi-parting power door modifier is <bipartingDoor>
    And the number of front car doors is <frontDoor>
    And the number of rear car doors is <rearDoor>
    And the unit is processed for duration
    Then duration PM/D is <pmd>
    And duration PM is <pm>
    And duration PM/MMR is <pmmmr>
    And duration IM is <im>
    And duration CAT1 is <cat1>

    # S  PM/D  PM  PM/MMR  IM  CAT1
    # 1  1     1   1       1   2
    # 2  1     1   1       1   2
    # 3  1     1.5 1       1   2
    Examples: 
      | unitType  | serviceLevel | foreignEquipment | bipartingDoor | frontDoor | rearDoor | pmd  | pm   | pmmmr | im | cat1 |
      # Service Level 1
      | EL-MR-001 |            1 | true             | true          |           |       10 | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-002 |            1 | true             | true          |           |          | 1.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-003 |            1 | true             | false         |           |        5 |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | true             | false         |           |        0 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | false            | true          |           |        5 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-002 |            1 | false            | true          |           |          | 1.25 | 1.25 |     1 |  1 |    2 |
      | EL-MR-003 |            1 | false            | false         |           |       10 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | false            | false         |           |        0 |    1 |    1 |     1 |  1 |    2 |
      # Service Level 2
      | EL-MR-001 |            2 | true             | true          |           |       10 | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-002 |            2 | true             | true          |           |          | 1.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-003 |            2 | true             | false         |           |        5 |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | true             | false         |           |        0 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | false            | true          |           |        5 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-002 |            2 | false            | true          |           |          | 1.25 | 1.25 |     1 |  1 |    2 |
      | EL-MR-003 |            2 | false            | false         |           |       10 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | false            | false         |           |        0 |    1 |    1 |     1 |  1 |    2 |
      # Service Level 3
      | EL-MR-001 |            3 | true             | true          |           |       10 | 2.25 | 2.25 |     1 |  1 |    2 |
      | EL-MR-002 |            3 | true             | true          |           |          | 1.25 |    2 |     1 |  1 |    2 |
      | EL-MR-003 |            3 | true             | false         |           |        5 |    1 |    2 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | true             | false         |           |        0 |    1 | 1.75 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | false            | true          |           |        5 | 2.25 |    2 |     1 |  1 |    2 |
      | EL-MR-002 |            3 | false            | true          |           |          | 1.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-003 |            3 | false            | false         |           |       10 |    1 | 1.75 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | false            | false         |           |        0 |    1 |  1.5 |     1 |  1 |    2 |
      # Tests rear doors and front doors - testing just the num of rear and front doors
      # no biparting power door
      # Service Level 1
      | EL-MR-001 |            1 | true             | false         |           |       10 |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-002 |            1 | true             | false         |           |          |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-003 |            1 | true             | false         |           |        5 |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | true             | false         |           |        0 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | false            | false         |           |        5 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-002 |            1 | false            | false         |           |          |    1 |    1 |     1 |  1 |    2 |
      | EL-MR-003 |            1 | false            | false         |           |       10 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | false            | false         |           |        0 |    1 |    1 |     1 |  1 |    2 |
      # Service Level 2
      | EL-MR-001 |            2 | true             | false         |           |       10 |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-002 |            2 | true             | false         |           |          |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-003 |            2 | true             | false         |           |        5 |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | true             | false         |           |        0 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | false            | false         |           |        5 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-002 |            2 | false            | false         |           |          |    1 |    1 |     1 |  1 |    2 |
      | EL-MR-003 |            2 | false            | false         |           |       10 |    1 | 1.25 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | false            | false         |           |        0 |    1 |    1 |     1 |  1 |    2 |
      # Service Level 3
      | EL-MR-001 |            3 | true             | false         |           |       10 |    1 |    2 |     1 |  1 |    2 |
      | EL-MR-002 |            3 | true             | false         |           |          |    1 | 1.75 |     1 |  1 |    2 |
      | EL-MR-003 |            3 | true             | false         |           |        5 |    1 |    2 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | true             | false         |           |        0 |    1 | 1.75 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | false            | false         |           |        5 |    1 | 1.75 |     1 |  1 |    2 |
      | EL-MR-002 |            3 | false            | false         |           |          |    1 |  1.5 |     1 |  1 |    2 |
      | EL-MR-003 |            3 | false            | false         |           |       10 |    1 | 1.75 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | false            | false         |           |        0 |    1 |  1.5 |     1 |  1 |    2 |
      # with biparting power door
      # Service Level 1
      | EL-MR-001 |            1 | true             | true          |           |       10 | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-002 |            1 | true             | true          |         3 |          |    2 |  1.5 |     1 |  1 |    2 |
      | EL-MR-003 |            1 | true             | true          |           |        5 | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | true             | true          |           |        0 | 1.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | false            | true          |           |        5 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-002 |            1 | false            | true          |           |          | 1.25 | 1.25 |     1 |  1 |    2 |
      | EL-MR-003 |            1 | false            | true          |           |       10 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            1 | false            | true          |           |        0 | 1.25 | 1.25 |     1 |  1 |    2 |
      # Service Level 2
      | EL-MR-001 |            2 | true             | true          |           |       10 | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-002 |            2 | true             | true          |         2 |          | 1.75 |  1.5 |     1 |  1 |    2 |
      | EL-MR-003 |            2 | true             | true          |           |        5 | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | true             | true          |         4 |        0 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | false            | true          |           |        5 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-002 |            2 | false            | true          |           |          | 1.25 | 1.25 |     1 |  1 |    2 |
      | EL-MR-003 |            2 | false            | true          |        10 |       10 | 2.25 |  1.5 |     1 |  1 |    2 |
      | EL-MR-001 |            2 | false            | true          |           |        0 | 1.25 | 1.25 |     1 |  1 |    2 |
      # Service Level 3
      | EL-MR-001 |            3 | true             | true          |           |       10 | 2.25 | 2.25 |     1 |  1 |    2 |
      | EL-MR-002 |            3 | true             | true          |         3 |          |    2 |    2 |     1 |  1 |    2 |
      | EL-MR-003 |            3 | true             | true          |           |        5 | 2.25 | 2.25 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | true             | true          |           |        0 | 1.25 |    2 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | false            | true          |           |        5 | 2.25 |    2 |     1 |  1 |    2 |
      | EL-MR-002 |            3 | false            | true          |         4 |          | 2.25 | 1.75 |     1 |  1 |    2 |
      | EL-MR-003 |            3 | false            | true          |        10 |       10 | 2.25 |    2 |     1 |  1 |    2 |
      | EL-MR-001 |            3 | false            | true          |           |        0 | 1.25 | 1.75 |     1 |  1 |    2 |
