IT-For-Concept-Mastery
===

Description here.

## Testing

To run test suite:

> $ rails test

## Development Server

To run on development server:

> $ rails server

## Progress Update (for devs)

Just Added:
- Admin column to table (integer), divisible by 5 if dev admin, 3 if user admin, 2 if manager admin
- All users page (only for dev admin), can delete users
- 3 example accounts each with different admin status, 20 other seeded example accounts
- Required to be logged in for sensitive pages

Learning-related stuff:
- /learning/dashboard is main place where learner goes to learn skills and view progress (like QuantHub's /dashboard + /learning/path)
- Skills are separated by not yet learned and mastered
- Learning a skill will lead user to an assessment (not implemented yet)
- No skillsets like QuantHub, just skills for simplicity
