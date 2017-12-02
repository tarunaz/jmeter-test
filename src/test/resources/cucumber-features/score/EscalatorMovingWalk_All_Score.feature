@EscalatorMovingWalk @All @Score
Feature: Calculate Score with All of the Parameters
  Using BRMS rules, given all of the parameters associated with a product type,
  figure out the total score associated with this product type

  Scenario Outline: Calculate Total Score using All Parameters for Escalator and Moving Walk
    Given a TKE unit type <unitType> for scoring
    And the score location is <location>
    And the usage is <usage>
    Then the total points is <totalPoints>

    Examples: 
      | unitType  | location | usage  | totalPoints |
      | ES-ES-001 | indoor   | medium |          10 |
      | ES-MW-001 | indoor   | high   |          20 |
      | ES-ES-001 | outdoor  | medium |          20 |
      | ES-MW-001 | outdoor  | high   |          30 |
