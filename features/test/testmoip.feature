Feature: API testmoip

	Scenario: Create customer
		Given I create a customer "auto1234"
		Then I see a response code 201
		And I see "auto1234" field
		Then i see a response code 400 for customer "repetido" invalid json

	Scenario: Create order
		Given I create a order a "shoes" for "auto1234"
		Then I see a response 201
		And I see "shoes" order
