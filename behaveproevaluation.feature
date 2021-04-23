Feature: BehaveProEvaluation

  Initial description details for BehavePro Evaluation. Manually entered via the Requirements tab in Jira 

  Scenario: Scenario Evaluation Set Up BehavePro
    Given BehavePro has been set up linked to GitHub to a sample project
    When I view the FFT team project tools
    Then I expect to see the BehavePro tool available
