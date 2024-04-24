# Testing Plan

Our test plan includes both automated and manual tests to ensure that features work properly in isolation and integration. We have test cases that check for proper functionality, and we have test cases that check to ensure incorrect actions cause errors. For instance, we check to make sure entering an incorrect password will not allow a user to log in.

## Automated Testing

We used built-in testing functionality from Rails to design a testing suite that tests the controllers, helpers, and models in our program as well as integration. We have 42 individual test cases with 81 total assertions. These automated tests are robust and test nearly all aspects of our program, although high-level functionality testing is done manually.

To run all the automated tests, enter the following command in the project directory:

  rails test

To run tests in a specific area of the program, add more information to the command:

	rails test:integration

The tests can be found in the test folder in the project directory. In the test folder, there are multiple folders containing files with test cases organized based on what is being tested.

## Manual Testing

We have created detailed test cases for user acceptance testing purposes. These test cases mirror possible user stories based on the high-level features of our project.

Our project is essentially a prototype, so no sensitive user information is stored. Therefore, our highest-risk features are user log-in and sign-up. These manual test cases help ensure that these features are as secure as possible.

### User Log-In and Sign-Up

Successful sign-up

* Go to Sign Up page

* Enter fields:

* Name: Test Account

* Email: testuser@ITFCM.org

* Password: Foobar1!

* Confirmation: Foobar1!

* Select “Create my account”

* Verify: success message & user account successfully added to database

Unsuccessful sign-up due to password requirements

* Go to Sign Up page

* Enter fields:

* Name: Test Account

* Email: testuser@ITFCM.org

* Password: Foo

* Confirmation: Foo

* Select “Create my account”

* Verify: password requirements message & account not created

Successful log-in

* Go to Log In page

* Enter fields:

* Email: testuser@ITFCM.org

* Password: Foobar1!

* Select “Log in”

* Verify: the user is logged in successfully

Unsuccessful log-in due to incorrect password

* Go to Log In page

* Enter fields:

* Email: testuser@ITFCM.org

* Password: Foboar1!

* Select “Log in”

* Verify: invalid email/password message & user not logged in

### Updating Account Settings

Updating user name

* Go to Account Settings page

* Enter new account name with other fields the same

* Select “Save changes”

* Verify: profile updated message & account name appears different

Updating password

* Go to Account Settings page

* Enter new password and confirmation with other fields the same

* Select “Save changes”

* Verify: profile updated message & new password is required during log-in

### Learning a Skill / Completing an Assessment

Completing an assessment with score over 80%

* Go to Learning Dashboard

* Click on a skill (“Miscellaneous”)

* Answer all questions correctly and submit

* Verify: finish screen shows perfect score & skill appears in Skills Mastered

Completing an assessment with score under 80%

* Go to Learning Dashboard

* Click on a skill (“Charts”)

* Answer approximately half of questions correctly and submit

* Verify: finish screen shows a score under 80% & skill appears in Skills In-Progress

### Viewing Questions and Skills

Viewing and destroying a question

* Go to Questions

* Click on a question (“Alabama is the best”)

* Verify: question is shown along with answer choices and correct answer

* Click on “Destroy this question”

* Verify: question is not on list and does not appear in any assessments

Viewing and destroying a skill

* Go to Skills

* Click on a skill (“Miscellaneous”)

* Verify: skill is shown along with questions corresponding to the skill

* Click on “Destroy this skill”

* Verify: skill is not on list and does not appear anywhere else

###  a Question

Creating a multiple choice question

* Go to Questions

* Click on “New question”

* Select “Multiple Choice” from dropdown menu

* Fill in the question field

* Fill in answer choice fields and correct answer choice

* Enter a hint field

* Click “Create Question”

* Verify: success message & question appears on list and in assessments

Creating a bar chart question / draggable bar chart question

* Go to Questions

* Click on “New question”

* Select “Bar Chart” from dropdown menu

* Fill in question and chart title

* Fill in bar labels and height bounds

* Fill in answer choice fields and correct answer choice

* Click “Create Question”

* Verify: success message & question appears on list and in assessments

Creating a line chart question / draggable line chart question

* Go to Questions

* Click on “New question”

* Select “Line Chart” from dropdown menu

* Fill in question and chart title

* Fill in point x and y coordinates

* Fill in answer choice fields and correct answer choice

* Click “Create Question”

* Verify: success message & question appears on list and in assessments

### Creating a Skill / Editing a Skill

Creating a new skill

* Go to Skills

* Click on “New skill”

* Enter skill name and description fields

* Select questions from list

* Click “Create Skill”

* Verify: success message & skill appears on list and on Learning Dashboard

Editing an existing skill

* Go to Skills

* Click on an existing skill (“Math review”)

* Click on “Edit this skill”

* Change fields (name, description, questions)

* Click on “Update Skill”

* Verify: success message & skill fields are changed

### Viewing User List

View list of all accounts

* Go to Users (as a dev admin)

* Verify: list of all users appears which is the same as in database

Deleting an account

* Go to Users (as a dev admin)

* Click “delete” next to a user’s name (“Emmett Collier”)

* Click “OK” on “You sure?” pop-up

* Verify: user account is not on the list & not in database anymore

