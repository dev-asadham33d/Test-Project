# README

# Test Project
The candidate will build a single-page application. On entry, it shows the following buttons:
- Personal Data
- Employment
Clicking on Personal Data will cause a Modal to appear, with the following entry fields:
- First Name – required, 25 characters limit
- Last Name – required, 50 characters limit
- Nickname – not required
- Email Address - required
- Phone Number - required
The model will have Save & Cancel buttons.

## Acceptance Criteria
Email field validation must be done dynamically, as the user enters it, cannot proceed to the
next field until this is filled and validated. The error will appear below the field if any.
Phone number validation must be done dynamically and needs to be in the form
XXX-XXX-XXXX. So, if the user enters 5551115555, as they’re entering it, it will be displayed
as 555-111-5555.
When the form is saved, it automatically goes into the second form: Employment. This will
also be a modal. It will have the following fields:
- Employer - required
- Date Started - required
- Date Employment Ended - required
Date fields requirements: calendar widget as well as manual input with field validation and
automatic insertion of separators (MM/DD/YYYY)
There will be an “Add Employment” button. When clicked, a new set of employment fields
are added.
The Save button will be grayed out until all the required fields are filled.

## Requirements
- Ruby 2.7.5
- Rails 7.0.0
- Hotwire
- Slim
- Stimulus
- TurboFrames
- Tailwind
- RSpec
- Faker

## Database
- MySQL
## Installation steps
- `bundle install`
- `rake db:create` `rake db:migrate`
- `rails s`
## Quick start for local development
The application will be running at http://localhost:3000/