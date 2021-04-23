Feature: BehaveProEvaluation

  @ORPHAN
  Scenario: BehaveProEvaluationWithGitHub
     Given BehavePro has been set up linked to GitHub to a sample project
     When I view the FFT team project tools
     Then I expect to see the BehavePro tool available
