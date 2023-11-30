# Setup

Running locally:

Ruby 2.7.2

```
bundle install
```

```
rails db:drop db:create db:migrate db:seed
```

Running tests:

```
RAILS_ENV=test rails db:drop db:create db:migrate db:seed
```

```
rails test
```

# Exercise

The objective of these exercises is to start a conversation about the trade-offs when making code changes, specifically
around how code improvements impact code design and performance. We expect you to spend no more than 2-3 hours working on the
exercises. Only the **first challenge** is required to be completed via code, **be prepared to discuss each challenge** and how you would solve it.

## Challenge 1: Feature Request

The product owner has requested that the previous and next step numbers be included in the [Cases#index](http://localhost:3000/cases)
response for each case that is shown. Add `previous_step_number` and `next_step_number` attributes to the JSON output of
the [Cases#index](http://localhost:3000/cases) response.

Please consider that the current implementation for the JSON response already includes the attribute for `current_step_number`,
this is a good start. It is important to follow the patterns that already exist in the code, hint: see `current_step_number` method in [Case](blob/main/app/models/case.rb).

Example of the current implementation:
```json
{
  "results": [
    {
      "id": 1,
      "candidate_fullname": "Pancho Villa",
      "candidate_email": "panchovilla@revolution.mx",
      "due_date": "2021-07-22T21:28:35.628Z",
      "applicant_has_been_notified": false,
      "current_step_number": 0,
      "current_step_due_date": null,
      "current_step_all_requirements_complete": true,
      "current_panel_name": "Case is Being Created"
    },
    {
      "id": 2,
      "candidate_fullname": "Rosita Alvirez",
      "candidate_email": "rosita@revolution.mx",
      "due_date": "2021-10-22T21:28:35.654Z",
      "applicant_has_been_notified": false,
      "current_step_number": 0,
      "current_step_due_date": null,
      "current_step_all_requirements_complete": true,
      "current_panel_name": "Case is Being Created"
    },
    {
      "id": 3,
      "candidate_fullname": "Pancho Villa 1",
      "candidate_email": "panchovilla@revolution1.mx",
      "due_date": "2021-07-22T21:28:35.682Z",
      "applicant_has_been_notified": false,
      "current_step_number": 0,
      "current_step_due_date": null,
      "current_step_all_requirements_complete": false,
      "current_panel_name": "Case is Being Created"
    }
    ...
  ]
}
```
## Challenge 2: Performance Improvements

Our monitoring system has identified that response times for the [Cases#index](http://localhost:3000/cases) endpoint are slow.
Pagination is not required to solve this, and the intent is to make little improvements on the queries that are being done
to generate the JSON response. Investigate and document your findings. Note: this could take a lot of time, but that
it is NOT the intent of this challenge to actually write the fixes.  We are not asking that every possible issue be identified, but rather to really
understand the problem and be prepared to talk about what improvements you would make.  If you really have time (we are
not expecting this but feel free to do it) re-factor any code related to your suggestion for improvement.

## Challenge 3: Tech Debt (This is a nice to have but not required to be completed)

The ActiveRecord [Case](blob/main/app/models/case.rb) model has been flagged for technical debt from our team, could
you list the top 3 changes that you would address and why.
