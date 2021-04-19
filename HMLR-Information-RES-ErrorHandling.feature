Feature: SanityCheck-HMLR-Information-RES-ErrorHandling
# NOTE
# THE SKELETON TEST PROJECT SHOULD CONTAIN AT LEAST ONE EXAMPLE OF EACH SCENARIO
# THE FULL TEST SUITE CAN BE FOUND IN THE AUTOMATED TEST PROJECT
# REMEMBER TO MAKE THE SAME CHANGES IN BOTH PRJECTS

Scenario Outline: RES-Error Handling Empty Mandatory Fields
    Given I have Json line {
	And I have Json line 	"callbackUrl" : "https://lmkbvt.azure-api.net/cscallbacktestharness/v1/writeblob?&subscription-key=3e3d6fcba6204596af4c54c7f46db84f",
    And I have Json line "event": {
    And I have Json line "legalEntity": "Common Services",
	And I have Json line "product": "CSTest-HMLRInformation",
	And I have Json line "applicationName": "CSTest",
	And I have Json line "environment": "Non-Live",
	And I have Json line "sessionId": "<Comment>",
	And I have Json line "userId": "AutoRegression",
	And I have Json line "eventName": "HmlrBusinessGateway"
    And I have Json line },
    And I have Json line "registerExtract": {
    And I have Json line   "continueIfTitleIsClosedAndContinued": <ContinueIfTitleIsClosedAndContinued>,
    And I have Json line   "notifyIfPendingFirstRegistration": <NotifyIfPendingFirstRegistration>,
    And I have Json line   "notifyIfPendingApplication": <NotifyIfPendingApplication>,
    And I have Json line   "sendBackDated": <SendBackDated>,
    And I have Json line   "continueIfActualFeeExceedsExpectedFee": <ContinueIfActualFeeExceedsExpectedFee>,
    And I have Json line   "includeTitlePlan": <IncludeTitlePlan>,
    And I have Json line   "expectedGrossPrice": <ExpectedGrossPrice>,
    And I have Json line   "titleNumber": "<TitleNumber>",
    And I have Json line   "externalReference": "<ExternalReference>",
    And I have Json line   "customerReference": "<CustomerReference>",
    And I have Json line   "allocatedBy": "<AllocatedBy>" 
	And I have Json line }
    And I have Json line }
    And I have Json line }
    And I post with request header Hmlr-Authorization with value Default
	And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/information?subscription-key=Replace
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response contains <ExpectedResponse>
Examples:								
| Comment                                                     | StatusCode | SessionsId                                 | ContinueIfTitleIsClosedAndContinued | NotifyIfPendingFirstRegistration | NotifyIfPendingApplication | SendBackDated | ContinueIfActualFeeExceedsExpectedFee | IncludeTitlePlan | ExpectedGrossPrice | TitleNumber | ExternalReference | CustomerReference | AllocatedBy | ExpectedResponse                                                     |
| 1.RES-Empty-continueIfTitleIsClosedAndContinued-Mandatory   | 400        | EmptyContinueIfTitleIsClosedAndContinued   |                                     | false                            | false                      | false         | false                                 | true             | 0.00               | GR506405    | CSTestTN01Del     | LMKCSTestUser     | CSTest      | {"message":"invalid request body given","messageId":"","requestId":" |
| 2.RES-Empty-notifyIfPendingFirstRegistration-Mandatory      | 400        | EmptyNotifyIfPendingFirstRegistration      | false                               |                                  | false                      | false         | false                                 | true             | 0.00               | GR506405    | CSTestTN01Del     | LMKCSTestUser     | CSTest      | {"message":"invalid request body given","messageId":"","requestId":" |

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

Scenario Outline: RES-Error Handling Invalid mandatory fields
    Given I have Json line {
	 And I have Json line 	"callbackUrl" : "https://lmkbvt.azure-api.net/cscallbacktestharness/v1/writeblob?&subscription-key=R3e3d6fcba6204596af4c54c7f46db84f",
     And I have Json line "event": {
     And I have Json line "legalEntity": "Common Services",
	 And I have Json line "product": "CSTest-HMLRInformation",
	 And I have Json line "applicationName": "CSTest",
	 And I have Json line "environment": "Non-Live",
	 And I have Json line "sessionId": "<Comment>",
	 And I have Json line "userId": "AutoRegression",
	 And I have Json line "eventName": "HmlrBusinessGateway"
     And I have Json line },
     And I have Json line "registerExtract": {
     And I have Json line   "continueIfTitleIsClosedAndContinued": <ContinueIfTitleIsClosedAndContinued>,
     And I have Json line   "notifyIfPendingFirstRegistration": <NotifyIfPendingFirstRegistration>,
     And I have Json line   "notifyIfPendingApplication": <NotifyIfPendingApplication>,
     And I have Json line   "sendBackDated": <SendBackDated>,
     And I have Json line   "continueIfActualFeeExceedsExpectedFee": <ContinueIfActualFeeExceedsExpectedFee>,
     And I have Json line   "includeTitlePlan": <IncludeTitlePlan>,
     And I have Json line   "expectedGrossPrice": <ExpectedGrossPrice>,
     And I have Json line   "titleNumber": "<TitleNumber>",
     And I have Json line   "externalReference": "<ExternalReference>","CSTestTN01DeliveredTest",
     And I have Json line   "customerReference": "<CustomerReference>","LMKCSTestUser",
     And I have Json line   "allocatedBy": "<AllocatedBy>"  "CSTest"
	 And I have Json line }
    And I have Json line }
    And I post with request header Hmlr-Authorization with value Default
	And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/information?subscription-key=Replace
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response contains <ExpectedResponse>
Examples:
| Comment                                                                          | StatusCode | SessionsId                                   | ContinueIfTitleIsClosedAndContinued | NotifyIfPendingFirstRegistration | NotifyIfPendingApplication | SendBackDated          | ContinueIfActualFeeExceedsExpectedFee | IncludeTitlePlan       | ExpectedGrossPrice     | TitleNumber            | ExternalReference      | CustomerReference      | AllocatedBy            | ExpectedResponse                                                     |
| RES-Invalid-continueIfTitleIsClosedAndContinued-Mandatory-should log to splunk   | 400        | InvalidContinueIfTitleIsClosedAndContinued   | !£$%^*()_+@:;'~/.,<>?,              | false                            | false                      | false                  | false                                 | true                   | 8.00                   | GR506405               | CSTestTN01Del          | LMKCSTestUser          | CSTest                 | {"message":"invalid request body given","messageId":"","requestId":" |
| RES-Invalid-notifyIfPendingFirstRegistration-Mandatory-should log to splunk      | 400        | InvalidNotifyIfPendingFirstRegistration      | false                               | !£$%^*()_+@:;'~/.,<>?,           | false                      | false                  | false                                 | true                   | 8.00                   | GR506405               | CSTestTN01Del          | LMKCSTestUser          | CSTest                 | {"message":"invalid request body given","messageId":"","requestId":" |



Scenario Outline: RES-Error Handling Invalid Quotes
    Given I have Json line {
	 And I have Json line 	"callbackUrl" : "https://lmkbvt.azure-api.net/cscallbacktestharness/v1/writeblob?&subscription-key=3e3d6fcba6204596af4c54c7f46db84f",
     And I have Json line "event": {
     And I have Json line "legalEntity": "Common Services",
	 And I have Json line "product": "CSTest-HMLRInformation",
	 And I have Json line "applicationName": "CSTest",
	 And I have Json line "environment": "Non-Live",
	 And I have Json line "sessionId": "<Comment>",
	 And I have Json line "userId": "AutoRegression",
	 And I have Json line "eventName": "HmlrBusinessGateway"
     And I have Json line },
     And I have Json line "registerExtract": {
	 And I have Json line   "titleNumber": <TitleNumber>
     And I have Json line   "expectedGrossPrice": <ExpectedGrossPrice>,
     And I have Json line   "externalReference": "Invalid Quotes Test",
     And I have Json line   "customerReference": "LMKCSTestUser",
	 And I have Json line   "allocatedBy": "CSTest",
     And I have Json line   "continueIfTitleIsClosedAndContinued": <ContinueIfTitleIsClosedAndContinued>,
     And I have Json line   "notifyIfPendingFirstRegistration": <NotifyIfPendingFirstRegistration>,
     And I have Json line   "notifyIfPendingApplication": <NotifyIfPendingApplication>,
     And I have Json line   "sendBackDated": <SendBackDated>,
     And I have Json line   "continueIfActualFeeExceedsExpectedFee": <ContinueIfActualFeeExceedsExpectedFee>,
     And I have Json line   "includeTitlePlan": <IncludeTitlePlan>,
	 And I have Json line }
     And I have Json line }
     And I post with request header Hmlr-Authorization with value Default
	 And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/information?subscription-key=Replace
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response contains <ExpectedResponse>
Examples:
| Comment                                                                       | StatusCode | SessionsId                                | ContinueIfTitleIsClosedAndContinued | NotifyIfPendingFirstRegistration | NotifyIfPendingApplication | SendBackDated | ContinueIfActualFeeExceedsExpectedFee | IncludeTitlePlan | ExpectedGrossPrice | TitleNumber | ExternalReference | CustomerReference | AllocatedBy | ExpectedResponse                                                     |
| RES-Quotes-continueIfTitleIsClosedAndContinued-Mandatory-should log to splunk | 400        | QuotesContinueIfTitleIsClosedAndContinued | "false                              | false                            | false                      | false         | false                                 | true             | 8.00               | "GR506405"  | "CSTestTN01Del"   | "LMKCSTestUser"   | "CSTest"    | {"message":"invalid request body given","messageId":"","requestId":" |
| RES-Quotes-notifyIfPendingFirstRegistration-Mandatory-should log to splunk    | 400        | QuotesNotifyIfPendingFirstRegistration    | false                               | "false                           | false                      | false         | false                                 | true             | 8.00               | "GR506405"  | "CSTestTN01Del"   | "LMKCSTestUser"   | "CSTest"    | {"message":"invalid request body given","messageId":"","requestId":" |
