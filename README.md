# Devise Playground

A Ruby on Rails application built for learning and experimenting with authentication and authorization concepts.

## About

This project was created as a personal playground to practice implementing:

- Authentication with Devise
- Authorization with Pundit
- User registration and login flows
- Protected routes and access control
- Rails 8 conventions and best practices

The primary goal of this application is to gain hands-on experience with user authentication and authorization in a Rails application.

## Technologies Used

- Ruby
- Ruby on Rails 8
- Devise
- Pundit
- SQLite3

## Features

- User sign up
- User sign in
- User sign out
- Session management
- Authorization policies using Pundit
- Protected resources and actions

## Getting Started

### Prerequisites

- Ruby
- Bundler
- SQLite3

### Installation

Clone the repository:

```bash
git clone https://github.com/hassanaly18/devise-playground.git
cd devise-playground
````

Install dependencies:

```bash
bundle install
```

Set up the database:

```bash
bin/rails db:create
bin/rails db:migrate
```

Start the development server:

```bash
bin/dev
```

Then visit:

```
http://localhost:3000
```

## Learning Objectives

This project was built to better understand:

* How Devise handles authentication in Rails
* How Pundit manages authorization through policies
* The difference between authentication and authorization
* Secure access control patterns in web applications
* Rails authentication workflows

## Future Improvements

* Email confirmation
* Password reset functionality
* User roles (Admin, Member, etc.)
* OAuth authentication (Google/GitHub)
* Audit logging
* Admin dashboard

## Status

This project is actively used for learning and experimentation. Features may be added, modified, or removed as new concepts are explored.

## License

This project is intended for educational and learning purposes.