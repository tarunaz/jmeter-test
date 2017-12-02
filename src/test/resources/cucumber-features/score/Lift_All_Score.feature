@Lift @All @Score
Feature: Calculate Score with All of the Parameters
  Using BRMS rules, given all of the parameters associated with a product type,
  figure out the total score associated with this product type

  Scenario Outline: Calculate Total Score using All Parameters for Lift
    Given a TKE unit type <unitType> for scoring
    When the annual callback is <annualCallback>
    And the control type is <controlType>
    And the environment is <environment>
    And the usage is <usage>
    Then the total points is <totalPoints>

    Examples: 
      | unitType  | annualCallback | controlType    | environment | usage  | totalPoints |
      # First level callbacks [0,1]
      | PL-HY-001 |              0 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              0 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              0 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              0 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              0 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              0 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              0 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              0 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              0 | solid state    | clean       | high   |           0 |
      | IL-001    |              0 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              0 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              0 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              0 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              0 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              0 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              0 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              0 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              0 | relay logic    | moderate    | high   |           0 |
      | PL-HY-001 |              1 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              1 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              1 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              1 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              1 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              1 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              1 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              1 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              1 | solid state    | clean       | high   |           0 |
      | IL-001    |              1 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              1 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              1 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              1 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              1 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              1 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              1 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              1 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              1 | relay logic    | moderate    | high   |           0 |
      #Second level callbacks [2,4]
      | PL-HY-001 |              2 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              2 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              2 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              2 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              2 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              2 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              2 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              2 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              2 | solid state    | clean       | high   |           0 |
      | IL-001    |              2 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              2 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              2 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              2 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              2 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              2 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              2 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              2 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              2 | relay logic    | moderate    | high   |           0 |
      | PL-HY-001 |              4 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              4 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              4 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              4 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              4 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              4 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              4 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              4 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              4 | solid state    | clean       | high   |           0 |
      | IL-001    |              4 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              4 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              4 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              4 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              4 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              4 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              4 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              4 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              4 | relay logic    | moderate    | high   |           0 |
      #Second level callbacks [5,7]
      | PL-HY-001 |              5 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              5 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              5 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              5 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              5 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              5 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              5 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              5 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              5 | solid state    | clean       | high   |           0 |
      | IL-001    |              5 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              5 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              5 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              5 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              5 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              5 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              5 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              5 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              5 | relay logic    | moderate    | high   |           0 |
      | PL-HY-001 |              7 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              7 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              7 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              7 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              7 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              7 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              7 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              7 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              7 | solid state    | clean       | high   |           0 |
      | IL-001    |              7 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              7 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              7 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              7 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              7 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              7 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              7 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              7 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              7 | relay logic    | moderate    | high   |           0 |
      #Second level callbacks [8,∞]
      | PL-HY-001 |              8 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |              8 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |              8 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |              8 | microprocessor | moderate    | low    |           0 |
      | IL-001    |              8 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |              8 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |              8 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |              8 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |              8 | solid state    | clean       | high   |           0 |
      | IL-001    |              8 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |              8 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |              8 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |              8 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |              8 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |              8 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |              8 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |              8 | relay logic    | moderate    | medium |           0 |
      | IL-001    |              8 | relay logic    | moderate    | high   |           0 |
      | PL-HY-001 |             50 | microprocessor | clean       | low    |           0 |
      | PL-TR-001 |             51 | microprocessor | clean       | medium |           0 |
      | ST-CH-001 |             52 | microprocessor | clean       | high   |           0 |
      | ST-PL-001 |             53 | microprocessor | moderate    | low    |           0 |
      | IL-001    |             54 | microprocessor | moderate    | medium |           0 |
      | GE-UN-001 |             55 | microprocessor | moderate    | high   |           0 |
      | PL-TR-001 |             56 | solid state    | clean       | low    |           0 |
      | ST-CH-001 |             57 | solid state    | clean       | medium |           0 |
      | ST-PL-001 |             58 | solid state    | clean       | high   |           0 |
      | IL-001    |             59 | solid state    | moderate    | low    |           0 |
      | EL-HL-001 |             60 | solid state    | moderate    | medium |           0 |
      | EL-HL-002 |             61 | solid state    | moderate    | high   |           0 |
      | EL-HL-003 |             62 | relay logic    | clean       | low    |           0 |
      | PL-HY-001 |             63 | relay logic    | clean       | medium |           0 |
      | PL-TR-001 |             64 | relay logic    | clean       | high   |           0 |
      | ST-CH-001 |             65 | relay logic    | moderate    | low    |           0 |
      | ST-PL-001 |             66 | relay logic    | moderate    | medium |           0 |
      | IL-001    |             67 | relay logic    | moderate    | high   |           0 |
