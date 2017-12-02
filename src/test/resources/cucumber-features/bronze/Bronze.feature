@Bronze @All @Complete
Feature: Calculate the Bronze Programs
  Using BRMS rules, calculate the Bronze Programs

  Scenario Outline: Calculate Bronze
    Given a bronze coverage type of <bct>
    And the bronze required frequency is <brf>
    And the bronze required frequency value is <brfv>
    And the bronze required duration is <brd>
    And the bronze required duration value is <brdv>
    And a TKE unit type <unitType> for complete process
    And the annual callback for complete process is <cb>
    And the control type for complete process is <controlType>
    And the environment for complete process is <environment>
    And the usage for complete process is <usage>
    And the number of openings for complete process is <op>
    And the foreign equipment for complete process is <fn>
    And the complete bi-parting power door for complete process is <biparting>
    And the complete freight door is <ft>
    And the complete drive type is <driveType>
    When I calculate bronze
    Then bronze status should be <status>
    And the bronze maintenance im-sla is <m-is>
    And the bronze duration im-sla is <d-is>
    And the bronze duration im is <d-i>

    Examples: 
      | unitType  | cb | controlType    | environment | usage  | op | fn   | ft   | biparting | productType  | driveType | brf   | brfv | brd   | brdv  | bct    | status | m-is | d-is  | d-i |
      | EL-DW-001 |  0 | microprocessor | moderate    | low    |  0 |      |      |           | dumbwaiter   |           | true  |    7 | true  |  1.75 | C301US | true   |    7 |  1.75 |     |
      | EL-HY-001 |  7 | solid state    | moderate    | medium |  7 |      |      |           | hydraulic    |           | true  |    2 | false |   2.0 | C302US | true   |    2 |   0.5 |     |
      | EL-HY-001 |  7 | solid state    | moderate    | medium |  7 |      |      |           | hydraulic    |           | false |      | true  |  3.45 | C304US | true   |    4 |  3.45 |     |
      | EL-HY-001 |  7 | solid state    | moderate    | medium |  7 |      |      |           | hydraulic    |           | false |    5 | false |       | C311US | true   |    4 |   0.5 |     |
      | EL-HY-001 |  7 | solid state    | moderate    | medium |  7 |      |      |           | hydraulic    |           | true  |    3 | false |       | F311US | false  |      |   0.5 | 0.5 |
      | EL-HY-001 |  7 | solid state    | moderate    | medium |  7 |      |      |           | hydraulic    |           | false |      | false |   5.0 | G311US | false  |      |       | 0.5 |
      | EL-HY-001 |  7 | solid state    | moderate    | medium |  7 |      |      |           | hydraulic    |           | true  |    2 | false |   9.0 | D511US | false  |      |   0.5 | 0.5 |
      | EL-DW-001 |  0 | microprocessor | moderate    | low    |  0 |      |      |           | dumbwaiter   |           | false |    6 | true  | 1.475 | C301US | true   |    4 | 1.475 |     |
      | EL-DW-001 |  1 | microprocessor | moderate    | high   |  5 | true | true | true      | dumbwaiter   |           | true  |   12 | true  |       | C211US | false  |    9 |       |     |
      | EL-DW-001 |  1 | microprocessor | moderate    | high   |  5 | true | true | true      | dumbwaiter   |           | true  |   12 | true  |     1 | C211US | false  |    9 |     1 |   1 |
      | EL-MR-001 |  3 | microprocessor | moderate    | high   |  5 | true | true | true      | mrl-traction |           | true  |    9 | false |     2 | C211US | false  |      |   0.5 |   1 |
      | EL-HL-001 |  3 | microprocessor | moderate    | high   |  5 | true | true | true      | hydraulic    |           | true  |   12 | false |       | C211US | false  |   10 |   0.5 | 0.5 |
      | EL-TR-002 |  3 | microprocessor | moderate    | high   |  5 | true | true | true      | hydraulic    |           | true  |   12 | true  |     4 | C101US | false  |    5 |     4 |   4 |
