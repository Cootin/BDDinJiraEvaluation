Feature: BehaveProEvaluation

  Initial description details for BehavePro Evaluation. Manually entered via the Requirements tab in Jira 

  @ORPHAN
  Scenario: Scenario Evaluation Set Up BehavePro
    Given BEhavePeo has been set up for manual testing FFT team project
    When I view the FFT team project tools
    Then I expect to see the BehavePro tool available
