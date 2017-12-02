@Dumbwaiter @All @Hydraulic @ServiceLevel
Feature: Calculate Service Level with Score
  Using BRMS rules, given the score for the unit type,
  figure out the service level associated with the product type

  Scenario Outline: Calculate Service Level Using Score for Hydraulic
    Given a TKE unit type <unitType> for service level
    When the score is <score>
    Then the service level is <serviceLevel>

    Examples: 
      | unitType  | score | serviceLevel |
      #Score [0,9]
      | EL-HY-001 |     0 |            1 |
      | EL-HY-002 |     5 |            1 |
      | EL-HY-003 |     9 |            1 |
      #Score [10,25]
      | EL-HY-004 |    10 |            2 |
      | EL-HY-005 |    15 |            2 |
      | EL-HY-006 |    25 |            2 |
      #Score [26,49]
      | EL-HY-007 |    26 |            3 |
      | EL-HY-001 |    35 |            3 |
      | EL-HY-002 |    49 |            3 |
      #Score [50,∞]
      | EL-HY-003 |    50 |            4 |
      | EL-HY-004 |   100 |            4 |
