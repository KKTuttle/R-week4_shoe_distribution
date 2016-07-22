# Shoe Distribution

#### Program that keeps track of shoe brands in shoe stores

#### By Katarina Tuttle

## Description

_This web application allows user to add shoe stores and shoe brands into the database. Name of any store can be modified (renamed/deleted)._

## Known Bugs

_none_

## Setup

* In Terminal, go to project folder
* Then run postgres
* In a new tab run the following commands:
  * rake db:create
  * rake db:migrate
  * rake db:test:prepare
  * then run $ ruby app.rb
  * Open browser and visit (http://localhost:4567/)

## User Stories

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
* As a user, I want to be able to add shoe brands to a store to show where they are sold.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I do not want stores and shoes to be saved if I enter a blank name.

## Support and contact details

_Contact by email: katka.karolcikova@gmail.com_
* Github: kktuttle
* https://github.com/KKTuttle/R-week4_shoe_distribution

## Technologies Used

* HTML
* Ruby
* Sinatra
* Postgres
* Active Record

### License

Copyright &copy; 2016 Katarina Tuttle
