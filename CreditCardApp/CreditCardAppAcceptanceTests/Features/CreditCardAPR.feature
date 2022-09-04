
Feature: Calculating Credit Card APR

Scenario: As a user who applies for credit card, then user should get APR based on user credit score

Given the following users applied for the credit card
| name             | ssn         | dob        |
| Mojtaba Mirzadeh | 123-00-1306 | 08/16/1990 |
When the user press the apply button
Then they should see the following APR rates
| ssn             | APR         |
| 123-00-1306     | 0.06%       |
