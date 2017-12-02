@Dumbwaiter @All @Score
Feature: Calculate Score with All of the Parameters
  Using BRMS rules, given all of the parameters associated with a product type,
  figure out the total score associated with this product type

  Scenario Outline: Calculate Total Score using All Parameters for Dumbwaiter
    Given a TKE unit type <unitType> for scoring
    When the annual callback is <annualCallback>
    And the control type is <controlType>
    And the environment is <environment>
    And the usage is <usage>
    Then the total points is <totalPoints>

    Examples: 
      | unitType  | annualCallback | controlType    | environment | usage  | totalPoints |
      # First level callbacks [0,1]
      | EL-DW-001 |              0 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              0 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              0 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              0 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              0 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              0 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              0 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              0 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              0 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              0 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              0 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              0 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              0 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              0 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              0 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              0 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              0 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              0 | relay logic    | moderate    | high   |           0 |
      | EL-DW-001 |              1 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              1 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              1 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              1 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              1 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              1 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              1 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              1 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              1 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              1 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              1 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              1 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              1 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              1 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              1 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              1 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              1 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              1 | relay logic    | moderate    | high   |           0 |
      #Second level callbacks [2,4]
      | EL-DW-001 |              2 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              2 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              2 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              2 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              2 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              2 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              2 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              2 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              2 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              2 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              2 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              2 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              2 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              2 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              2 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              2 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              2 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              2 | relay logic    | moderate    | high   |           0 |
      | EL-DW-001 |              4 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              4 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              4 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              4 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              4 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              4 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              4 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              4 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              4 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              4 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              4 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              4 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              4 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              4 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              4 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              4 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              4 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              4 | relay logic    | moderate    | high   |           0 |
      #Second level callbacks [5,7]
      | EL-DW-001 |              5 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              5 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              5 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              5 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              5 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              5 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              5 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              5 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              5 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              5 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              5 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              5 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              5 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              5 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              5 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              5 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              5 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              5 | relay logic    | moderate    | high   |           0 |
      | EL-DW-001 |              7 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              7 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              7 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              7 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              7 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              7 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              7 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              7 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              7 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              7 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              7 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              7 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              7 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              7 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              7 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              7 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              7 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              7 | relay logic    | moderate    | high   |           0 |
      #Second level callbacks [8,∞]
      | EL-DW-001 |              8 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |              8 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |              8 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |              8 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |              8 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |              8 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |              8 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |              8 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |              8 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |              8 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |              8 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |              8 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |              8 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |              8 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |              8 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |              8 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |              8 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |              8 | relay logic    | moderate    | high   |           0 |
      | EL-DW-001 |             50 | microprocessor | clean       | low    |           0 |
      | EL-DW-001 |             51 | microprocessor | clean       | medium |           0 |
      | EL-DW-001 |             52 | microprocessor | clean       | high   |           0 |
      | EL-DW-001 |             53 | microprocessor | moderate    | low    |           0 |
      | EL-DW-001 |             54 | microprocessor | moderate    | medium |           0 |
      | EL-DW-001 |             55 | microprocessor | moderate    | high   |           0 |
      | EL-DW-001 |             56 | solid state    | clean       | low    |           0 |
      | EL-DW-001 |             57 | solid state    | clean       | medium |           0 |
      | EL-DW-001 |             58 | solid state    | clean       | high   |           0 |
      | EL-DW-001 |             59 | solid state    | moderate    | low    |           0 |
      | EL-DW-001 |             60 | solid state    | moderate    | medium |           0 |
      | EL-DW-001 |             61 | solid state    | moderate    | high   |           0 |
      | EL-DW-001 |             62 | relay logic    | clean       | low    |           0 |
      | EL-DW-001 |             63 | relay logic    | clean       | medium |           0 |
      | EL-DW-001 |             64 | relay logic    | clean       | high   |           0 |
      | EL-DW-001 |             65 | relay logic    | moderate    | low    |           0 |
      | EL-DW-001 |             66 | relay logic    | moderate    | medium |           0 |
      | EL-DW-001 |             67 | relay logic    | moderate    | high   |           0 |
