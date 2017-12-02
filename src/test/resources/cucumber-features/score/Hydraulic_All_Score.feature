@Hydraulic @All @Score
Feature: Calculate Score with All of the Parameters
  Using BRMS rules, given all of the parameters associated with a product type,
  figure out the total score associated with this product type

  Scenario Outline: Calculate Total Score using All Parameters for Hydraulic
    Given a TKE unit type <unitType> for scoring
    When the annual callback is <annualCallback>
    And the control type is <controlType>
    And the environment is <environment>
    And the usage is <usage>
    Then the total points is <totalPoints>

    Examples: 
      | unitType  | annualCallback | controlType    | environment | usage  | totalPoints |
      # First level callbacks [0,1]
      | EL-HY-001 |              0 | microprocessor | clean       | low    |           0 |
      | EL-HY-002 |              0 | microprocessor | clean       | medium |           5 |
      | EL-HY-003 |              0 | microprocessor | clean       | high   |          15 |
      | EL-HY-004 |              0 | microprocessor | moderate    | low    |           5 |
      | EL-HY-005 |              0 | microprocessor | moderate    | medium |          10 |
      | EL-HY-006 |              0 | microprocessor | moderate    | high   |          20 |
      | EL-HY-001 |              0 | solid state    | clean       | low    |           5 |
      | EL-HY-002 |              0 | solid state    | clean       | medium |          10 |
      | EL-HY-003 |              0 | solid state    | clean       | high   |          20 |
      | EL-HY-004 |              0 | solid state    | moderate    | low    |          10 |
      | EL-HY-005 |              0 | solid state    | moderate    | medium |          15 |
      | EL-HY-006 |              0 | solid state    | moderate    | high   |          25 |
      | EL-HY-001 |              0 | relay logic    | clean       | low    |          15 |
      | EL-HY-002 |              0 | relay logic    | clean       | medium |          20 |
      | EL-HY-003 |              0 | relay logic    | clean       | high   |          30 |
      | EL-HY-004 |              0 | relay logic    | moderate    | low    |          20 |
      | EL-HY-005 |              0 | relay logic    | moderate    | medium |          25 |
      | EL-HY-006 |              0 | relay logic    | moderate    | high   |          35 |
      | EL-HY-001 |              1 | microprocessor | clean       | low    |           0 |
      | EL-HY-002 |              1 | microprocessor | clean       | medium |           5 |
      | EL-HY-003 |              1 | microprocessor | clean       | high   |          15 |
      | EL-HY-004 |              1 | microprocessor | moderate    | low    |           5 |
      | EL-HY-005 |              1 | microprocessor | moderate    | medium |          10 |
      | EL-HY-006 |              1 | microprocessor | moderate    | high   |          20 |
      | EL-HY-001 |              1 | solid state    | clean       | low    |           5 |
      | EL-HY-002 |              1 | solid state    | clean       | medium |          10 |
      | EL-HY-003 |              1 | solid state    | clean       | high   |          20 |
      | EL-HY-004 |              1 | solid state    | moderate    | low    |          10 |
      | EL-HY-005 |              1 | solid state    | moderate    | medium |          15 |
      | EL-HY-006 |              1 | solid state    | moderate    | high   |          25 |
      | EL-HY-001 |              1 | relay logic    | clean       | low    |          15 |
      | EL-HY-002 |              1 | relay logic    | clean       | medium |          20 |
      | EL-HY-003 |              1 | relay logic    | clean       | high   |          30 |
      | EL-HY-004 |              1 | relay logic    | moderate    | low    |          20 |
      | EL-HY-005 |              1 | relay logic    | moderate    | medium |          25 |
      | EL-HY-006 |              1 | relay logic    | moderate    | high   |          35 |
      #Second level callbacks [2,4]
      | EL-HY-001 |              2 | microprocessor | clean       | low    |           5 |
      | EL-HY-002 |              2 | microprocessor | clean       | medium |          10 |
      | EL-HY-003 |              2 | microprocessor | clean       | high   |          20 |
      | EL-HY-004 |              2 | microprocessor | moderate    | low    |          10 |
      | EL-HY-005 |              2 | microprocessor | moderate    | medium |          15 |
      | EL-HY-006 |              2 | microprocessor | moderate    | high   |          25 |
      | EL-HY-001 |              2 | solid state    | clean       | low    |          10 |
      | EL-HY-002 |              2 | solid state    | clean       | medium |          15 |
      | EL-HY-003 |              2 | solid state    | clean       | high   |          25 |
      | EL-HY-004 |              2 | solid state    | moderate    | low    |          15 |
      | EL-HY-005 |              2 | solid state    | moderate    | medium |          20 |
      | EL-HY-006 |              2 | solid state    | moderate    | high   |          30 |
      | EL-HY-001 |              2 | relay logic    | clean       | low    |          20 |
      | EL-HY-002 |              2 | relay logic    | clean       | medium |          25 |
      | EL-HY-003 |              2 | relay logic    | clean       | high   |          35 |
      | EL-HY-004 |              2 | relay logic    | moderate    | low    |          25 |
      | EL-HY-005 |              2 | relay logic    | moderate    | medium |          30 |
      | EL-HY-006 |              2 | relay logic    | moderate    | high   |          40 |
      | EL-HY-001 |              4 | microprocessor | clean       | low    |           5 |
      | EL-HY-002 |              4 | microprocessor | clean       | medium |          10 |
      | EL-HY-003 |              4 | microprocessor | clean       | high   |          20 |
      | EL-HY-004 |              4 | microprocessor | moderate    | low    |          10 |
      | EL-HY-005 |              4 | microprocessor | moderate    | medium |          15 |
      | EL-HY-006 |              4 | microprocessor | moderate    | high   |          25 |
      | EL-HY-001 |              4 | solid state    | clean       | low    |          10 |
      | EL-HY-002 |              4 | solid state    | clean       | medium |          15 |
      | EL-HY-003 |              4 | solid state    | clean       | high   |          25 |
      | EL-HY-004 |              4 | solid state    | moderate    | low    |          15 |
      | EL-HY-005 |              4 | solid state    | moderate    | medium |          20 |
      | EL-HY-006 |              4 | solid state    | moderate    | high   |          30 |
      | EL-HY-001 |              4 | relay logic    | clean       | low    |          20 |
      | EL-HY-002 |              4 | relay logic    | clean       | medium |          25 |
      | EL-HY-003 |              4 | relay logic    | clean       | high   |          35 |
      | EL-HY-004 |              4 | relay logic    | moderate    | low    |          25 |
      | EL-HY-005 |              4 | relay logic    | moderate    | medium |          30 |
      | EL-HY-006 |              4 | relay logic    | moderate    | high   |          40 |
      #Second level callbacks [5,7]
      | EL-HY-001 |              5 | microprocessor | clean       | low    |          10 |
      | EL-HY-002 |              5 | microprocessor | clean       | medium |          15 |
      | EL-HY-003 |              5 | microprocessor | clean       | high   |          25 |
      | EL-HY-004 |              5 | microprocessor | moderate    | low    |          15 |
      | EL-HY-005 |              5 | microprocessor | moderate    | medium |          20 |
      | EL-HY-006 |              5 | microprocessor | moderate    | high   |          30 |
      | EL-HY-001 |              5 | solid state    | clean       | low    |          15 |
      | EL-HY-002 |              5 | solid state    | clean       | medium |          20 |
      | EL-HY-003 |              5 | solid state    | clean       | high   |          30 |
      | EL-HY-004 |              5 | solid state    | moderate    | low    |          20 |
      | EL-HY-005 |              5 | solid state    | moderate    | medium |          25 |
      | EL-HY-006 |              5 | solid state    | moderate    | high   |          35 |
      | EL-HY-001 |              5 | relay logic    | clean       | low    |          25 |
      | EL-HY-002 |              5 | relay logic    | clean       | medium |          30 |
      | EL-HY-003 |              5 | relay logic    | clean       | high   |          40 |
      | EL-HY-004 |              5 | relay logic    | moderate    | low    |          30 |
      | EL-HY-005 |              5 | relay logic    | moderate    | medium |          35 |
      | EL-HY-006 |              5 | relay logic    | moderate    | high   |          45 |
      | EL-HY-001 |              7 | microprocessor | clean       | low    |          10 |
      | EL-HY-002 |              7 | microprocessor | clean       | medium |          15 |
      | EL-HY-003 |              7 | microprocessor | clean       | high   |          25 |
      | EL-HY-004 |              7 | microprocessor | moderate    | low    |          15 |
      | EL-HY-005 |              7 | microprocessor | moderate    | medium |          20 |
      | EL-HY-006 |              7 | microprocessor | moderate    | high   |          30 |
      | EL-HY-001 |              7 | solid state    | clean       | low    |          15 |
      | EL-HY-002 |              7 | solid state    | clean       | medium |          20 |
      | EL-HY-003 |              7 | solid state    | clean       | high   |          30 |
      | EL-HY-004 |              7 | solid state    | moderate    | low    |          20 |
      | EL-HY-005 |              7 | solid state    | moderate    | medium |          25 |
      | EL-HY-006 |              7 | solid state    | moderate    | high   |          35 |
      | EL-HY-001 |              7 | relay logic    | clean       | low    |          25 |
      | EL-HY-002 |              7 | relay logic    | clean       | medium |          30 |
      | EL-HY-003 |              7 | relay logic    | clean       | high   |          40 |
      | EL-HY-004 |              7 | relay logic    | moderate    | low    |          30 |
      | EL-HY-005 |              7 | relay logic    | moderate    | medium |          35 |
      | EL-HY-006 |              7 | relay logic    | moderate    | high   |          45 |
      #Last level callbacks [8,∞]
      | EL-HY-001 |              8 | microprocessor | clean       | low    |          25 |
      | EL-HY-002 |              8 | microprocessor | clean       | medium |          30 |
      | EL-HY-003 |              8 | microprocessor | clean       | high   |          40 |
      | EL-HY-004 |              8 | microprocessor | moderate    | low    |          30 |
      | EL-HY-005 |              8 | microprocessor | moderate    | medium |          35 |
      | EL-HY-006 |              8 | microprocessor | moderate    | high   |          45 |
      | EL-HY-001 |              8 | solid state    | clean       | low    |          30 |
      | EL-HY-002 |              8 | solid state    | clean       | medium |          35 |
      | EL-HY-003 |              8 | solid state    | clean       | high   |          45 |
      | EL-HY-004 |              8 | solid state    | moderate    | low    |          35 |
      | EL-HY-005 |              8 | solid state    | moderate    | medium |          40 |
      | EL-HY-006 |              8 | solid state    | moderate    | high   |          50 |
      | EL-HY-001 |              8 | relay logic    | clean       | low    |          40 |
      | EL-HY-002 |              8 | relay logic    | clean       | medium |          45 |
      | EL-HY-003 |              8 | relay logic    | clean       | high   |          55 |
      | EL-HY-004 |              8 | relay logic    | moderate    | low    |          45 |
      | EL-HY-005 |              8 | relay logic    | moderate    | medium |          50 |
      | EL-HY-006 |              8 | relay logic    | moderate    | high   |          60 |
      | EL-HY-001 |             50 | microprocessor | clean       | low    |          25 |
      | EL-HY-002 |             51 | microprocessor | clean       | medium |          30 |
      | EL-HY-003 |             52 | microprocessor | clean       | high   |          40 |
      | EL-HY-004 |             53 | microprocessor | moderate    | low    |          30 |
      | EL-HY-005 |             54 | microprocessor | moderate    | medium |          35 |
      | EL-HY-006 |             55 | microprocessor | moderate    | high   |          45 |
      | EL-HY-001 |             56 | solid state    | clean       | low    |          30 |
      | EL-HY-002 |             57 | solid state    | clean       | medium |          35 |
      | EL-HY-003 |             58 | solid state    | clean       | high   |          45 |
      | EL-HY-004 |             59 | solid state    | moderate    | low    |          35 |
      | EL-HY-005 |             60 | solid state    | moderate    | medium |          40 |
      | EL-HY-006 |             61 | solid state    | moderate    | high   |          50 |
      | EL-HY-001 |             62 | relay logic    | clean       | low    |          40 |
      | EL-HY-002 |             63 | relay logic    | clean       | medium |          45 |
      | EL-HY-003 |             64 | relay logic    | clean       | high   |          55 |
      | EL-HY-004 |             65 | relay logic    | moderate    | low    |          45 |
      | EL-HY-005 |             66 | relay logic    | moderate    | medium |          50 |
      | EL-HY-006 |             67 | relay logic    | moderate    | high   |          60 |
      #
      # When the environment is 'extreme', then give the highest score regardless of other variables
      #
      # First level callbacks [0,1]
      | EL-HY-001 |              0 | microprocessor | extreme     | low    |        1000 |
      | EL-HY-002 |              0 | microprocessor | extreme     | medium |        1005 |
      | EL-HY-003 |              0 | microprocessor | extreme     | high   |        1015 |
      | EL-HY-004 |              0 | microprocessor | extreme     | low    |        1000 |
      | EL-HY-005 |              0 | microprocessor | extreme     | medium |        1005 |
      | EL-HY-006 |              0 | microprocessor | extreme     | high   |        1015 |
      | EL-HY-001 |              0 | solid state    | extreme     | low    |        1005 |
      | EL-HY-002 |              0 | solid state    | extreme     | medium |        1010 |
      | EL-HY-003 |              0 | solid state    | extreme     | high   |        1020 |
      | EL-HY-001 |              1 | relay logic    | extreme     | low    |        1015 |
      | EL-HY-002 |              1 | relay logic    | extreme     | medium |        1020 |
      | EL-HY-003 |              1 | relay logic    | extreme     | high   |        1030 |
      # Second level callbacks [2,4]
      | EL-HY-001 |              2 | microprocessor | extreme     | low    |        1005 |
      | EL-HY-002 |              2 | microprocessor | extreme     | medium |        1010 |
      | EL-HY-003 |              2 | microprocessor | extreme     | high   |        1020 |
      | EL-HY-004 |              2 | microprocessor | extreme     | low    |        1005 |
      | EL-HY-005 |              3 | microprocessor | extreme     | medium |        1010 |
      | EL-HY-006 |              3 | microprocessor | extreme     | high   |        1020 |
      | EL-HY-001 |              3 | solid state    | extreme     | low    |        1010 |
      | EL-HY-002 |              3 | solid state    | extreme     | medium |        1015 |
      | EL-HY-003 |              4 | solid state    | extreme     | high   |        1025 |
      | EL-HY-001 |              4 | relay logic    | extreme     | low    |        1020 |
      | EL-HY-002 |              4 | relay logic    | extreme     | medium |        1025 |
      | EL-HY-003 |              4 | relay logic    | extreme     | high   |        1035 |
      # Third level callbacks [5,7]
      | EL-HY-001 |              5 | microprocessor | extreme     | low    |        1010 |
      | EL-HY-002 |              5 | microprocessor | extreme     | medium |        1015 |
      | EL-HY-003 |              5 | microprocessor | extreme     | high   |        1025 |
      | EL-HY-004 |              5 | microprocessor | extreme     | low    |        1010 |
      | EL-HY-005 |              6 | microprocessor | extreme     | medium |        1015 |
      | EL-HY-006 |              6 | microprocessor | extreme     | high   |        1025 |
      | EL-HY-001 |              6 | solid state    | extreme     | low    |        1015 |
      | EL-HY-002 |              6 | solid state    | extreme     | medium |        1020 |
      | EL-HY-003 |              7 | solid state    | extreme     | high   |        1030 |
      | EL-HY-001 |              7 | relay logic    | extreme     | low    |        1025 |
      | EL-HY-002 |              7 | relay logic    | extreme     | medium |        1030 |
      | EL-HY-003 |              7 | relay logic    | extreme     | high   |        1040 |
      # Last level callbacks [8,∞]
      | EL-HY-001 |              8 | microprocessor | extreme     | low    |        1025 |
      | EL-HY-002 |              8 | microprocessor | extreme     | medium |        1030 |
      | EL-HY-003 |              8 | microprocessor | extreme     | high   |        1040 |
      | EL-HY-004 |              8 | microprocessor | extreme     | low    |        1025 |
      | EL-HY-005 |             15 | microprocessor | extreme     | medium |        1030 |
      | EL-HY-006 |             15 | microprocessor | extreme     | high   |        1040 |
      | EL-HY-001 |             15 | solid state    | extreme     | low    |        1030 |
      | EL-HY-002 |             15 | solid state    | extreme     | medium |        1035 |
      | EL-HY-003 |            100 | solid state    | extreme     | high   |        1045 |
      | EL-HY-001 |            100 | relay logic    | extreme     | low    |        1040 |
      | EL-HY-002 |            100 | relay logic    | extreme     | medium |        1045 |
      | EL-HY-003 |            100 | relay logic    | extreme     | high   |        1055 |
