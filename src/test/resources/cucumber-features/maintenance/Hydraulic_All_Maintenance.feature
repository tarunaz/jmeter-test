@Hydraulic @All @Maintenance
Feature: Calculate Maintenance with Item Type and Service Level
  Using BRMS rules, given the item type, service level, and openings,
  figure out the maintenance for each of the different variation

  Scenario Outline: Calculate Maintenance using Item Type, Score, and Openings for Hydraulic
    Given a TKE unit type <unitType> for maintenance
    When the calculated service level is <serviceLevel>
    And the number of openings is <openings>
    When the unit is processed for maintenance
    Then PM/D is <pmd>
    And PM is <pm>
    And IM is <im>
    And PT is <pt>

    Examples: 
      | unitType  | serviceLevel | openings | pmd | pm | im | pt |
      #Service Level 1
      #--> Openings [2,4]
      | EL-HY-001 |            1 |        2 |   0 |  1 |  1 |  1 |
      | EL-HY-002 |            1 |        3 |   0 |  1 |  1 |  1 |
      | EL-HY-003 |            1 |        4 |   0 |  1 |  1 |  1 |
      #--> Openings [5,8]
      | EL-HY-004 |            1 |        5 |   1 |  1 |  0 |  1 |
      | EL-HY-005 |            1 |        7 |   1 |  1 |  0 |  1 |
      | EL-HY-006 |            1 |        8 |   1 |  1 |  0 |  1 |
      #--> Openings [9,12]
      | EL-HY-001 |            1 |        9 |   2 |  1 |  0 |  1 |
      | EL-HY-002 |            1 |       10 |   2 |  1 |  0 |  1 |
      | EL-HY-003 |            1 |       12 |   2 |  1 |  0 |  1 |
      #--> Openings [13,16]
      | EL-HY-004 |            1 |       13 |   3 |  1 |  0 |  1 |
      | EL-HY-005 |            1 |       14 |   3 |  1 |  0 |  1 |
      | EL-HY-006 |            1 |       16 |   3 |  1 |  0 |  1 |
      #Service Level 2
      #--> Openings [2,4]
      | EL-HY-001 |            2 |        2 |   0 |  1 |  2 |  1 |
      | EL-HY-002 |            2 |        3 |   0 |  1 |  2 |  1 |
      | EL-HY-003 |            2 |        4 |   0 |  1 |  2 |  1 |
      #--> Openings [5,8]
      | EL-HY-004 |            2 |        5 |   1 |  1 |  1 |  1 |
      | EL-HY-005 |            2 |        7 |   1 |  1 |  1 |  1 |
      | EL-HY-006 |            2 |        8 |   1 |  1 |  1 |  1 |
      #--> Openings [9,12]
      | EL-HY-001 |            2 |        9 |   2 |  1 |  0 |  1 |
      | EL-HY-002 |            2 |       10 |   2 |  1 |  0 |  1 |
      | EL-HY-003 |            2 |       12 |   2 |  1 |  0 |  1 |
      #--> Openings [13,16]
      | EL-HY-004 |            2 |       13 |   3 |  1 |  0 |  1 |
      | EL-HY-005 |            2 |       14 |   3 |  1 |  0 |  1 |
      | EL-HY-006 |            2 |       16 |   3 |  1 |  0 |  1 |
      #Service Level 3
      #--> Openings [2,4]
      | EL-HY-001 |            3 |        2 |   0 |  1 |  2 |  1 |
      | EL-HY-002 |            3 |        3 |   0 |  1 |  2 |  1 |
      | EL-HY-003 |            3 |        4 |   0 |  1 |  2 |  1 |
      #--> Openings [5,8]
      | EL-HY-004 |            3 |        5 |   1 |  1 |  1 |  1 |
      | EL-HY-005 |            3 |        7 |   1 |  1 |  1 |  1 |
      | EL-HY-006 |            3 |        8 |   1 |  1 |  1 |  1 |
      #--> Openings [9,12]
      | EL-HY-001 |            3 |        9 |   2 |  1 |  0 |  1 |
      | EL-HY-002 |            3 |       10 |   2 |  1 |  0 |  1 |
      | EL-HY-003 |            3 |       12 |   2 |  1 |  0 |  1 |
      #--> Openings [13,16]
      | EL-HY-004 |            3 |       13 |   3 |  1 |  0 |  1 |
      | EL-HY-005 |            3 |       14 |   3 |  1 |  0 |  1 |
      | EL-HY-006 |            3 |       16 |   3 |  1 |  0 |  1 |
      #Service Level 4
      #--> Openings [2,4]
      | EL-HY-001 |            4 |        2 |   0 |  1 |  4 |  1 |
      | EL-HY-002 |            4 |        3 |   0 |  1 |  4 |  1 |
      | EL-HY-003 |            4 |        4 |   0 |  1 |  4 |  1 |
      #--> Openings [5,8]
      | EL-HY-004 |            4 |        5 |   1 |  1 |  3 |  1 |
      | EL-HY-005 |            4 |        7 |   1 |  1 |  3 |  1 |
      | EL-HY-006 |            4 |        8 |   1 |  1 |  3 |  1 |
      #--> Openings [9,12]
      | EL-HY-001 |            4 |        9 |   2 |  1 |  2 |  1 |
      | EL-HY-002 |            4 |       10 |   2 |  1 |  2 |  1 |
      | EL-HY-003 |            4 |       12 |   2 |  1 |  2 |  1 |
      #--> Openings [13,16]
      | EL-HY-004 |            4 |       13 |   3 |  1 |  1 |  1 |
      | EL-HY-005 |            4 |       14 |   3 |  1 |  1 |  1 |
      | EL-HY-006 |            4 |       16 |   3 |  1 |  1 |  1 |
