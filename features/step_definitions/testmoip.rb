Given(/^I create a customer "([^"]*)"$/) do |ownId|
  @response = testmoip.post_customer("#{ownId}", "customers")
end

Then(/^I see a response code 201$/) do
	expect(@response.code).to be(201)
end

Then(/^I see "([^"]*)" field$/) do |field|
	parsed_response = JSON.parse(@response.body)
	expect(parsed_response['ownId']).to include("#{field}")
end

Then(/^i see a response code 400 for customer "([^"]*)" invalid json$/) do |ownId|
  @response = testmoip.post_customer("#{ownId}", "customers")
  expect(@response.code).to be(400)
end

Given(/^I create a order a "([^"]*)" for "([^"]*)"$/) do |item, ownId|
  @response = testmoip.post_order("#{ownId}", "#{item}", "orders")
end

Then(/^I see a response 201$/) do
  expect(@response.code).to be(201)
end

And(/^I see "([^"]*)" order$/) do |order|
	parsed_response = JSON.parse(@response.body)
 	expect(parsed_response['items'][0]['product']).to include("#{order}")
end
