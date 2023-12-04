# Back-end Application
## Tech details

|**Resource**|**Resource Name**|**Version**|**Comment**|
| :-: | :-: | :-: | :-: |
|Back-end programming language|ruby|3.1.4||
|Back-end web framework|Rails|7.1.2||

## Installation & Lunch

How to run a project locally?

1. Preparing
Make sure that defined ruby and rails gem are installed on your machine. After that, install all other gems used in this project with bundle install. Last step will be starting PostgreSQL database on your localhost within the credentials set at `config/database.yml`

2. Start server
To start our server on uor localhost run `rails s`

3. Stop server
To stop our server on our localhost use `Ctrl-C`

4. Run migrations or detabase schema

To create database `rails db:create`. 

To run migrations `rails db:migrate`

5. Run unit tests

To run unit tests run `rspec` or `rspec file/to/test`

7. Show logs
Rails will automatically show all the logs on your terminal window.

## Check Web Interface

1. Open a browser

2. Past `https://testtaskgithubapi-b3bf79670448.herokuapp.com/` in serach field

3. Enter your github login and press the button

## Check Web Interface Graphiql

1. Open a browser

2. Past `https://testtaskgithubapi-b3bf79670448.herokuapp.com/graphiql` in serach field

3. Enter `query {getGithubData(githubLogin: "githubLogin")}` where `githubLogin` is your github login