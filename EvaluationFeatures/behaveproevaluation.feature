Feature: BehaveProEvaluation

  Initial description details for BehavePro Evaluation.
  Manually entered via the Requirements tab in Jira when linked to GitHub. Set Up with Github sample projects.

  Scenario: BehaveProEvaluationWithGitHub
    Given BehavePro has been set up linked to GitHub to a sample project
    When I view the FFT team project tools
    Then I expect to see the BehavePro tool available

  @EAS-2677 @COMPLETED
  Scenario: Automation scenario created
    Given BehavePro has been set up linked to GitHub to a sample project
    When I view the FFT team project tools
    Then I expect to see the Testmode set to Automated

  @EAS-2677 @COMPLETED
  Scenario: BehaveProEvaluationManualScenario
    Given BehavePro has been set up manual testing Fulfilment team project
    When I view the Fulfilment team project tools
    Then I expect to see Fulfilment tool available
