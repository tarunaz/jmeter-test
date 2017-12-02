@EscalatorMovingWalk @All @ServiceLevel
Feature: Calculate Service Level with Score
  Using BRMS rules, given the score for the unit type,
  figure out the service level associated with the product type

  Scenario Outline: Calculate Service Level Using Score for Escalator and Moving Walk
    Given a TKE unit type <unitType> for service level
    When the score is <score>
    Then the service level is <serviceLevel>

    Examples: 
      | unitType  | score | serviceLevel |
      #Score [0,10]
      | ES-ES-001 |     0 |            1 |
      | ES-MW-001 |     5 |            1 |
      | ES-ES-001 |    10 |            1 |
      #Score [11,∞]
      | ES-MW-001 |    11 |            2 |
      | ES-ES-001 |   100 |            2 |
