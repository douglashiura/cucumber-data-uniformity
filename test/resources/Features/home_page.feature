Feature: Home page
	
	In order to load
	As a guest
	Should be able to visit our web site

	Scenario: The application has a home page
	
		Given I do have a web application
		When I visit the home page
		Then I should see the home page
		And I should see navigation menu
		And I should see login button
		And I should see list of categories and subcategories
	
	Scenario: 
	
		Given I am on homepage as guest
		When I click on login button
		Then I should see pop-up login form 
		
