@MrlTraction @All @ServiceLevel
Feature: Calculate Service Level with Score
  Using BRMS rules, given the score for the unit type,
  figure out the service level associated with the product type

  Scenario Outline: Calculate Service Level Using Score for MRL Traction
    Given a TKE unit type <unitType> for service level
    When the score is <score>
    Then the service level is <serviceLevel>

    Examples: 
      | unitType  | score | serviceLevel |
      #Score [0,10]
      | EL-MR-001 |     0 |            1 |
      | EL-MR-002 |     5 |            1 |
      | EL-MR-003 |    10 |            1 |
      #Score [11,19]
      | EL-MR-004 |    11 |            2 |
      | EL-MR-005 |    15 |            2 |
      | EL-MR-006 |    19 |            2 |
      #Score [20,∞]
      | EL-MR-001 |    20 |            3 |
      | EL-MR-002 |    25 |            3 |
      | EL-MR-003 |    55 |            3 |
