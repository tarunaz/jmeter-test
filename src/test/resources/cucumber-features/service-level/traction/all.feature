@Traction @All @ServiceLevel
Feature: Calculate Service Level with Score
  Using BRMS rules, given the score for the unit type,
  figure out the service level associated with the product type

  Scenario Outline: Calculate Service Level Using Score for Traction
    Given a TKE unit type <unitType> for service level
    When the score is <score>
    Then the service level is <serviceLevel>

    Examples: 
      | unitType  | score | serviceLevel |
      #Score [0,14]
      | EL-TR-001 |     0 |            1 |
      | EL-TR-002 |     5 |            1 |
      | EL-TR-003 |    14 |            1 |
      #Score [15,29]
      | EL-TR-001 |    15 |            2 |
      | EL-TR-002 |    22 |            2 |
      | EL-TR-003 |    29 |            2 |
      #Score [30,54]
      | EL-TR-001 |    30 |            3 |
      | EL-TR-002 |    40 |            3 |
      | EL-TR-003 |    54 |            3 |
      #Score [55,∞]
      | EL-TR-001 |    55 |            4 |
      | EL-TR-002 |   100 |            4 |
