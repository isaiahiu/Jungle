# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Functional Features

#### Feature: Sold Out Badge

- [x] Major: When a product has 0 quantity, a sold out badge should be displayed on the product list page
- [ ] Minor: Should ideally be implemented as a question/boolean method in view helper and/or Product model

#### Feature: Admin Categories

- [x] Major: Admin users can list and create new categories
- [x] Major: Admins can add new products using the new category
- [ ] Major: Restful routes (`resources`) should be used, and there should be no extra, unused routes exposed
- [ ] Bonus: All admin controllers inherit from `Admin::BaseController` (or similarly named) abstract controller, containing the authentication filter

#### Feature: User Authentication

- [x] Major: As a Visitor I can go to the registration page from any page in order to create an account
- [x] Major: As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
- [x] Major: As a Visitor I can sign in using my e-mail and password
- [x] Major: As a User I can log out from any page
- [x] Major: As a User I cannot sign up with an existing e-mail address (uniqueness validation)
- [x] Major: Passwords are not stored as plain text in the database. Instead, `has_secure_password` is used in the User model, leveraging the `bcrypt` gem

#### Enhancement: Order Details Page

- [x] Major: The order page contains items, their image, name, description, quantities and line item totals
- [x] Major: The final amount for the order is displayed
- [ ] Minor: The email that was used to place the order is displayed
- [ ] Minor: As a Visitor I can place an order (i.e. without logging in and therefore without an e-mail address). The original functionality from the inherited code (even though it is not realistic) should therefore not be suppressed.

#### Bug: Missing Admin Security

- [x] Major: User must enter HTTP auth login/password to access admin functionality
- [ ] Bonus: Should ideally be implemented in an abstract top-level class for admin controllers (e.g., `Admin::BaseController` which the other concrete admin controllers inherit)

#### Bug: Checking Out with Empty Cart

- [x] Major: When the cart is empty and the user goes to the carts#show page, instead of displaying the contents and a stripe checkout button, display a friendly message about how it is empty and link to the home page

## Git

- [x] Minor: The git commit history should have multiple commits and reasonable commit messages. There should be good use of branching and merging for each feature.

## Stretch Features

#### Automated Tests

- [ ] The automated tests are not required for the project to be submitted.

#### Feature: Product Rating

- [ ] Major: Use of nested resources in the routing, and not using custom controller actions
- [ ] Major: As a visitor I can view the overall rating of products as I browse the catalog
- [ ] Major: As a visitor I can view the list of ratings and reviews when viewing the product detail
- [ ] Major: As a logged in user I can rate & review a product in a single step
- [ ] Minor: As a logged in user I can delete a rating or review that I previously created

#### Feature: Email Receipt

- [ ] Major: The e-mail content should be (minimally) formatted with HTML
  - [ ] It does not need any layout styling and should be mostly, if not all, text (i.e. make do with `<p>`, `<hr>`, `<h1>`, `<br>` and other simple formatting tags)
  - [ ] Since you don't know their name information, it can just have a generic greeting
- [ ] Major: It should list the total as well as each line item in the order
- [ ] Minor: The Order ID should be in the subject line
