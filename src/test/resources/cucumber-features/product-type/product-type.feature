@ProductType
Feature: Calculate Product Type
  Using BRMS rules, given the unit type of the product, figure
  out the product type category to which this unit type is associated.

  Scenario Outline: Calculate Product Type from Unit Type
    Given a TKE unit type <unitType>
    Then the product type is <productType>

    Examples: 
      | unitType  | productType           |
      | EL-HY-001 | hydraulic             |
      | EL-HY-002 | hydraulic             |
      | EL-HY-003 | hydraulic             |
      | EL-HY-004 | hydraulic             |
      | EL-HY-005 | hydraulic             |
      | EL-HY-006 | hydraulic             |
      | EL-HY-007 | hydraulic             |
      | EL-TR-001 | traction              |
      | EL-TR-002 | traction              |
      | EL-TR-003 | traction              |
      | EL-MR-001 | mrl-traction          |
      | EL-MR-002 | mrl-traction          |
      | EL-MR-003 | mrl-traction          |
      | EL-MR-004 | mrl-traction          |
      | EL-MR-005 | mrl-traction          |
      | EL-MR-006 | mrl-traction          |
      | ES-ES-001 | escalator-moving-walk |
      | ES-MW-001 | escalator-moving-walk |
      | EL-DW-001 | dumbwaiter            |
      | EL-HL-001 | lift                  |
      | EL-HL-002 | lift                  |
      | EL-HL-003 | lift                  |
      | PL-HY-001 | lift                  |
      | PL-TR-001 | lift                  |
      | ST-CH-001 | lift                  |
      | ST-PL-001 | lift                  |
      | IL-001    | lift                  |
      | GE-UN-001 | lift                  |
