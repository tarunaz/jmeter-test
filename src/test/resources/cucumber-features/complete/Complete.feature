@All @Complete
Feature: Calculate the Entire Maintenance and Duration
  Using BRMS rules, given the product information, 
  figure out the complete information for each of the different variations

  Scenario Outline: Calculate Everything For a Product
    Given a TKE unit type <unitType> for complete process
    And the annual callback for complete process is <cb>
    And the control type for complete process is <controlType>
    And the environment for complete process is <environment>
    And the usage for complete process is <usage>
    And the number of openings for complete process is <openings>
    And the foreign equipment for complete process is <foreign>
    And the complete bi-parting power door for complete process is <biparting>
    And the complete freight door is <freight>
    And the complete drive type is <driveType>
    When I calculate the complete process
    Then the complete product type is <productType>
    And the complete score is <score>
    And the complete service level is <sl>
    And the complete maintenance PM is <m_pm>
    And the complete maintenance PM/D is <m_pmd>
    And the complete maintenance IM is <m_im>
    And the complete maintenance PT is <m_pt>
    And the complete maintenance PM/MMR is <m_pm-mmr>
    And the complete maintenance CAT1 is <m_cat1>
    And the complete duration PM is <d_pm>
    And the complete duration PM/D is <d_pmd>
    And the complete duration IM is <d_im>
    And the complete duration PT is <d_pt>
    And the complete duration PM/MMR is <d_pm-mmr>
    And the complete duration CAT1 is <d_cat1>

    # <--------------------------------------------------------INPUT------------------------------------------------->|<---------------------------------------------------------OUTPUT------------------------------------------------------------>
    Examples: 
      | unitType  | cb | controlType    | environment | usage  | openings | foreign | freight | biparting | driveType | productType | score | sl | m_pm | m_pm-mmr | m_pmd | m_im | m_pt | m_cat1 | d_pm | d_pmd | d_im | d_pt | d_pm-mmr | d_cat1 |
      # Dumbwaiter
      | EL-DW-001 |  0 | microprocessor | moderate    | low    |        0 |         |         |           |           | dumbwaiter  |     0 |  1 |      |          |       |    3 |      |        |      |       |  0.5 |      |          |        |
      # Hydraulic
      | EL-HY-001 |  7 | solid state    | moderate    | medium |        7 |         |         |           |           | hydraulic   |    25 |  2 |    1 |          |     1 |    1 |    1 |        |  1.5 |     1 |  0.5 |    1 |          |        |
      | EL-HY-002 |  7 | solid state    | moderate    | medium |        7 |         |         |           |           | hydraulic   |    25 |  2 |    1 |          |     1 |    1 |    1 |        |  1.5 |     1 |  0.5 |    1 |          |        |
      | EL-HY-003 |  7 | solid state    | moderate    | medium |        7 | true    |         |           |           | hydraulic   |    25 |  2 |    1 |          |     1 |    1 |    1 |        | 1.75 |     1 |  0.5 |    1 |          |        |
      | EL-HY-004 |  7 | solid state    | moderate    | medium |        7 | true    |         | true      |           | hydraulic   |    25 |  2 |    1 |          |     1 |    1 |    1 |        |  2.0 |     1 |  0.5 |    1 |          |        |
      # Traction
      | EL-TR-001 |  7 | microprocessor | moderate    | medium |        9 |         |         |           | SCR       | traction    |    30 |  3 |    1 |        1 |     3 |    3 |      |      1 |  1.5 |     1 |    1 |      |      1.5 |      2 |
      | EL-TR-002 |  7 | microprocessor | moderate    | medium |        9 | true    | true    |           | SCR       | traction    |    30 |  3 |    1 |        1 |     3 |    3 |      |      1 |  2.0 |     1 |    1 |      |      1.5 |      2 |
