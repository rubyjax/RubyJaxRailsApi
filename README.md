# RubyJax Website

This project is an API for the local RubyJax website. In its current form it
list the current upcoming talks.

# Prequisites

* Ruby version: 2.3.1
* Rails version: 5.1.2
* Database:  Postgres
* Test suite:  RSpec

## Getting Started
Clone the application:

```
clone git@github.com:rubyjax/RubyJaxRailsApi.git
cd RubyJaxRailsApi
```

Prepare your database:
```
rake db:create
rake db:migrate
```

## Run the tests
You can run the test suite, which is RSpec based, by executing the following command:

```
rspec
```

## Seed the database

```
rake db:seed
```

## Start Web Server - Development environment

```
rails server
```
