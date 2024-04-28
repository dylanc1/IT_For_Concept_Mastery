IT-For-Concept-Mastery
===

This project creates a learning platform that can be used to create quizzes on a variety of topics. Questions can include hints and
line/bar charts, and the assessment includes a current score tracker. A user's skill mastery is shown in their learning dashboard, 
and when a skill is mastered, it is moved to the 'Skills Mastered' section of the user's dashboard. Skills and Questions can be 
created by an admin account, and developer admins can remove users.

## Testing

To run test suite:

> $ rails test

## Development Server

To run on development server:

> $ rails server

## Current Features
- User accounts (including developer and manager admins with special privileges)
- Questions that can either be multiple choice or text submission, with optional graph content
- Skills that questions can be associated to during creation/edit
- An assessment that can be completed by users for each skill to prove mastery
- A learning dashboard that displays all the skills categorized by mastery level

## Potential Extensions
- Email verification/2-factor authentication
- Graph submissions for questions
- Customizable mastery thresholds for each skill (currently is standardized at 80%)

## Known Issues
- Skills without questions are still displayed in the learning dashboard, and this will
cause an error if a user tries to take that quiz's assessment.
