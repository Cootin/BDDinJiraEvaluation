Feature: SanityCheck-HMLR-Verification-ServiceErrorHandling
# NOTE
# THE SKELETON TEST PROJECT SHOULD CONTAIN AT LEAST ONE EXAMPLE OF EACH SCENARIO
# THE FULL TEST SUITE CAN BE FOUND IN THE AUTOMATED TEST PROJECT
# REMEMBER TO MAKE THE SAME CHANGES IN BOTH PRJECTS


Scenario Outline: Error Handling on Invalid URL
    Given I have Json File <Json>
    And I post with request header Hmlr-Authorization with value Default
	And I post to url https://lmkbvt.azure-api.net/BVT/<ServiceName>/<Version>/<Method>?subscription-key=<APIsubscription>
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response equal <ExpectedResponse>
Examples:								
| Comment             | Json                       | ServiceName | Version | Method           | APIsubscription | StatusCode | ExpectedResponse                                                                                                                                |
| ServiceName         | HMLR-Verification-OOV.json | hmlrbgtest  | v1      | verification     | Replace         | 404        | { "statusCode": 404, "message": "Resource not found" }                                                                                          |
| Version-            | HMLR-Verification-OOV.json | hmlrbg      | A1      | verification     | Replace         | 404        | { "statusCode": 404, "message": "Resource not found" }                                                                                          |
| Subscription_key    | HMLR-Verification-OOV.json | hmlrbg      | v1      | verification     | 102030405       | 401        | { "statusCode": 401, "message": "Access denied due to invalid subscription key. Make sure to provide a valid key for an active subscription." } |
| Method-Verification | HMLR-Verification-OOV.json | hmlrbg      | v1      | testverification | Replace         | 404        | { "statusCode": 404, "message": "Resource not found" }                                                                                          |
| Method-Information  | HMLR-Information-RES.json  | hmlrbg      | v1      | testinformation  | Replace         | 404        | { "statusCode": 404, "message": "Resource not found" }                                                                                          |



Scenario Outline: Error Handling for Invalid Subscription Key
    Given I have Json File <Json>
	And I post with request header Hmlr-Authorization with value Default
    And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/<Method>?subscription-key=<APIsubscription>
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response equal <ExpectedResponse>
Examples:										
| Comment                  | Method       | Json                       | APIsubscription | StatusCode | ExpectedResponse                                                                                                                                |
| Verification-OOV-Invalid | verification | HMLR-Verification-OOV.json | 102030405       | 401        | { "statusCode": 401, "message": "Access denied due to invalid subscription key. Make sure to provide a valid key for an active subscription." } |



Scenario Outline: Error Handling Json Post Handling
    Given I have Json line <Json>
    And I post with request header Hmlr-Authorization with value Default
	And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/<Method>?subscription-key=Replace
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response contains <ExpectedResponse>
Examples:								
| Comment                                                                         | Json | Method       | StatusCode | ExpectedResponse                                                     |
| Verification-OOV-Empty Json                                                     |      | verification | 400        | {"message":"invalid request body given","messageId":"","requestId":" |
| Verification-OOV-Invalid Json ClosingBracketOnly-should log to splunk no detail | }    | verification | 400        | {"message":"invalid request body given","messageId":"","requestId":" |
| Information-RES-Invalid Json OpenBracketOnly-should log to splunk  no detail    | {    | information  | 400        | {"message":"invalid request body given","messageId":"","requestId":" |



Scenario Outline: Error Handling for Invalid Json-Missing Brackets
    Given I have Json File <Json>
	And I post with request header Hmlr-Authorization with value Default
    And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/verification?subscription-key=Replace
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response contains <ExpectedResponse>
    # Removed ending } bracket from json file to create invalid Json format 
	Examples:								
| Comment                                       | Json                                  | StatusCode | ExpectedResponse                                                     |
| Verification-OOV-Invalid-Json Missing Bracket | Invalid-HMLR-Verification-OOV-MB.json | 400        | {"message":"invalid request body given","messageId":"","requestId":" |
| Information-RES-Invalid-Json Missing Bracket  | Invalid-HMLR-Information-RES-MB.json  | 400        | {"message":"invalid request body given","messageId":"","requestId":" | 



Scenario Outline: Error Handling for Invalid Json-Missing Comma
    Given I have Json File <Json>
	And I post with request header Hmlr-Authorization with value Default
    And I post to url https://lmkbvt.azure-api.net/BVT/hmlrbg/v1/verification?subscription-key=Replace
    When I view the returned post response
    Then a HTTP <StatusCode> will be returned
    And the returned response contains <ExpectedResponse>
    # Removed comma from Json files to create invalid Json format
	Examples:								
| Comment                                                         | Json                                            | StatusCode | ExpectedResponse                                                     |
| Verification-OOV-Invalid-Json MissingCommaInParameter           | Invalid-HMLR-Verification-OOV-MCinParmeter.json | 400        | {"message":"invalid request body given","messageId":"","requestId":" |
| Information-RES-Invalid-Json Missing Comma-should log to splunk | Invalid-HMLR-Information-RES-MC.json            | 400        | {"message":"invalid request body given","messageId":"","requestId":" |
