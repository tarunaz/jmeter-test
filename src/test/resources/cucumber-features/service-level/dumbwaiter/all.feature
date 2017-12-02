@Dumbwaiter @All @ServiceLevel
Feature: Calculate Service Level with Score
  Using BRMS rules, given the score for the unit type,
  figure out the service level associated with the product type

  Scenario Outline: Calculate Service Level Using Score for Dumbwaiter
    Given a TKE unit type <unitType> for service level
    When the score is <score>
    Then the service level is <serviceLevel>

    Examples: 
      | unitType  | score | serviceLevel |
      #Score [0,14]
      | EL-DW-001 |     0 |            1 |
      | EL-DW-001 |     5 |            1 |
      | EL-DW-001 |    14 |            1 |
      #Score [15,29]
      | EL-DW-001 |    15 |            1 |
      | EL-DW-001 |    22 |            1 |
      | EL-DW-001 |    29 |            1 |
      #Score [30,54]
      | EL-DW-001 |    30 |            1 |
      | EL-DW-001 |    40 |            1 |
      | EL-DW-001 |    55 |            1 |
      #Score [55,∞]
      | EL-DW-001 |    59 |            1 |
      | EL-DW-001 |   100 |            1 |
