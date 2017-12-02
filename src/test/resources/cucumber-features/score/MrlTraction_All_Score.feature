@MrlTraction @All @Score
Feature: Calculate Score with All of the Parameters
  Using BRMS rules, given all of the parameters associated with a product type,
  figure out the total score associated with this product type

  Scenario Outline: Calculate Total Score using All Parameters for MRL Traction
    Given a TKE unit type <unitType> for scoring
    When the annual callback is <annualCallback>
    And the control type is <controlType>
    And the environment is <environment>
    And the usage is <usage>
    Then the total points is <totalPoints>

    Examples: 
      | unitType  | annualCallback | environment | usage  | totalPoints | controlType    |
      # First level callbacks [0,3]
      | EL-MR-001 |              0 | clean       | low    |           0 | microprocessor |
      | EL-MR-002 |              0 | clean       | medium |           5 | microprocessor |
      | EL-MR-003 |              0 | clean       | high   |          15 | microprocessor |
      | EL-MR-004 |              0 | moderate    | low    |           5 | microprocessor |
      | EL-MR-005 |              0 | moderate    | medium |          10 | microprocessor |
      | EL-MR-006 |              0 | moderate    | high   |          20 | microprocessor |
      | EL-MR-001 |              0 | dirty       | low    |          15 | microprocessor |
      | EL-MR-002 |              0 | dirty       | medium |          20 | microprocessor |
      | EL-MR-003 |              0 | dirty       | high   |          30 | microprocessor |
      | EL-MR-001 |              3 | clean       | low    |           0 | microprocessor |
      | EL-MR-002 |              3 | clean       | medium |           5 | microprocessor |
      | EL-MR-003 |              3 | clean       | high   |          15 | microprocessor |
      | EL-MR-004 |              3 | moderate    | low    |           5 | microprocessor |
      | EL-MR-005 |              3 | moderate    | medium |          10 | microprocessor |
      | EL-MR-006 |              3 | moderate    | high   |          20 | microprocessor |
      | EL-MR-001 |              3 | dirty       | low    |          15 | microprocessor |
      | EL-MR-002 |              3 | dirty       | medium |          20 | microprocessor |
      | EL-MR-003 |              3 | dirty       | high   |          30 | microprocessor |
      #Second level callbacks [4,7]
      | EL-MR-001 |              4 | clean       | low    |           5 | microprocessor |
      | EL-MR-002 |              4 | clean       | medium |          10 | microprocessor |
      | EL-MR-003 |              4 | clean       | high   |          20 | microprocessor |
      | EL-MR-004 |              4 | moderate    | low    |          10 | microprocessor |
      | EL-MR-005 |              4 | moderate    | medium |          15 | microprocessor |
      | EL-MR-006 |              4 | moderate    | high   |          25 | microprocessor |
      | EL-MR-001 |              4 | dirty       | low    |          20 | microprocessor |
      | EL-MR-002 |              4 | dirty       | medium |          25 | microprocessor |
      | EL-MR-003 |              4 | dirty       | high   |          35 | microprocessor |
      | EL-MR-001 |              5 | clean       | low    |           5 | microprocessor |
      | EL-MR-002 |              5 | clean       | medium |          10 | microprocessor |
      | EL-MR-003 |              5 | clean       | high   |          20 | microprocessor |
      | EL-MR-004 |              5 | moderate    | low    |          10 | microprocessor |
      | EL-MR-005 |              5 | moderate    | medium |          15 | microprocessor |
      | EL-MR-006 |              5 | moderate    | high   |          25 | microprocessor |
      | EL-MR-001 |              5 | dirty       | low    |          20 | microprocessor |
      | EL-MR-002 |              5 | dirty       | medium |          25 | microprocessor |
      | EL-MR-003 |              5 | dirty       | high   |          35 | microprocessor |
      | EL-MR-001 |              7 | clean       | low    |           5 | microprocessor |
      | EL-MR-002 |              7 | clean       | medium |          10 | microprocessor |
      | EL-MR-003 |              7 | clean       | high   |          20 | microprocessor |
      | EL-MR-004 |              7 | moderate    | low    |          10 | microprocessor |
      | EL-MR-005 |              7 | moderate    | medium |          15 | microprocessor |
      | EL-MR-006 |              7 | moderate    | high   |          25 | microprocessor |
      | EL-MR-001 |              7 | dirty       | low    |          20 | microprocessor |
      | EL-MR-002 |              7 | dirty       | medium |          25 | microprocessor |
      | EL-MR-003 |              7 | dirty       | high   |          35 | microprocessor |
      #Second level callbacks [8,∞]
      | EL-MR-001 |              8 | clean       | low    |          15 | microprocessor |
      | EL-MR-002 |              8 | clean       | medium |          20 | microprocessor |
      | EL-MR-003 |              8 | clean       | high   |          30 | microprocessor |
      | EL-MR-004 |              8 | moderate    | low    |          20 | microprocessor |
      | EL-MR-005 |              8 | moderate    | medium |          25 | microprocessor |
      | EL-MR-006 |              8 | moderate    | high   |          35 | microprocessor |
      | EL-MR-001 |              8 | dirty       | low    |          30 | microprocessor |
      | EL-MR-002 |              8 | dirty       | medium |          35 | microprocessor |
      | EL-MR-003 |              8 | dirty       | high   |          45 | microprocessor |
