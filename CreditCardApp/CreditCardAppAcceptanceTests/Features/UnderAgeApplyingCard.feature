
Feature: Applying for credit card while under 18

Scenario: As a user who is less than 18 years old, when user apply for credit card then it should be denied

Given the following user information
| name             | ssn         | dob        |
| Mojtaba Mirzadeh | 123-00-1306 | 08/16/2008 |
When user press the apply button
Then user should get a rejection message
