@Dumbwaiter @All @Lift @ServiceLevel
Feature: Calculate Service Level with Score
  Using BRMS rules, given the score for the unit type,
  figure out the service level associated with the product type

  Scenario Outline: Calculate Service Level Using Score for Lift
    Given a TKE unit type <unitType> for service level
    When the score is <score>
    Then the service level is <serviceLevel>

    Examples: 
      | unitType  | score | serviceLevel |
      #Score [0,14]
      | EL-HL-001 |     0 |            1 |
      | EL-HL-002 |     5 |            1 |
      | EL-HL-003 |    14 |            1 |
      #Score [15,29]
      | PL-HY-001 |    15 |            1 |
      | PL-TR-001 |    22 |            1 |
      | ST-CH-001 |    29 |            1 |
      #Score [30,54]
      | ST-PL-001 |    30 |            1 |
      | IL-001    |    40 |            1 |
      | GE-UN-001 |    55 |            1 |
      #Score [55,∞]
      | EL-HL-001 |    59 |            1 |
      | EL-HL-002 |   100 |            1 |
