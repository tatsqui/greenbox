# GreenBox

## Learning Goals

* Build a system using composition
* Create and instantiate classes with attributes
* Create class and instance methods
* Manipulate data in a complex data structure
* Build code to match tests

This is a stage 2, individual project.


## Introduction

Your instructors have decided it would be a **brilliant** idea to start a company called **GreenBox** renting physical movie disks.  This system will operate with an electronic kiosk and a website.  A user will find and reserve movies for a period of days and then stop by the nearest kiosk to pick up the movie.  Another developer is building the kiosk UI and website, and you have been assigned the task to build a system to track movies and rentals.  **Your job is to implement the business logic only.** You do not need to build a CLI for this project.

Most of the tests to verify your implementation have been written.  You will use these tests to verify your implementation.

### Expectations
This project is both a culmination of our Intro to Ruby unit and intended to help you build up your skills at creating classes and methods. This means the requirement are less ambiguous and open-ended than the Hotel project. This is intentional to help you focus on core skills.

You will be expected to:

*  Read existing tests and extrapolate the code necessary to make the tests successful.
*  Ask questions when you need clarification

## Setup
We will use the same project structure we used for the previous project. Classes should be in files in the lib folder, and tests are in files in the specs folder. This project utilizes a `spec_helper` file.  **You will need to add `require_relative` statements in `spec_helper.rb` to enable the project to use your classes.  You will run tests by executing the rake command, as configured in a Rakefile.

1.   Fork this repository in GitHub
1.   Clone the repository to your computer
1.   Create/copy a rakefile to run your tests
1.   Unskip the first test for the `Movie` class (`movie_spec.rb`) and run the test (RED)
1.   Create the class for the object tested in the step above (GREEN)
1.   Use git add, commit and push commands to push your initial code to GitHub


## Process
You should use the following process as much as possible:

Write examine tests
Write pseudocode
Write code
Run tests
Fix code until the tests pass
Commit
You should have 95% code coverage using simplecov.

Your git commit history should provide a clear description of how your code developed, letting the reader know what changed when and why.  **Make meaningful commit messages**

## Wave 1 Movie Class

In this wave you will create a `Movie` class.  A movie represents a film in our system database.  A movie will have the following attributes:

*  id:  The id number of the DVD or BlueRay
*  title:  The title of the movie
*  publisher:  The company publishing the film
*  actors: A collection of actors starring in the film

A movie will have one additional method, `starring(actor_name)`.  This method will return true if the given actor does appear in the movie.

You have a set of spec files provided for the `movie` class.  Write code to ensure that the class passes the given tests.

## Wave 2: DateRange & Rental

### DateRange

When a movie is being rented you need to understand when that rental occurs.  To represent that interval of time, you will create a `DateRange` class.

A `DateRange` will have the following attributes:

*   start_date: The date the range begins
*   end_date:   The date the range ends

The `DateRange` will have the following methods:

*   overlaps(other_date_range) - This method takes another date range as a parameter and returns `true` if the date ranges overlap.  **Note** you will need to do a little research or work to determine how to identify overlapping date ranges.
*   contains(date) - This method returns true if the date occurs on or after the start date and before the end date.
*   nights - This method will return the number of nights included in the given `DateRange

### Rental

A `Rental` represents a movie rental in the system.

A `Rental` will contain the following attributes:

*   date_range:  The dates from the check out to check in dates
*   movie:  The movie being rented
*   customer:  The name of the customer making the rental

A `Rental` will have the follwing methods:

*   cost:  This method will return the cost of the rental.  A movie rental will cost $3.0 per night.  The customer is **not** charged for the day the movie is checked in.  So a movie checked out on August 8th and checked in August 10th would cost $3.00 * 2 days = $6.00

## Wave 3

For Wave 3 you will create a `RentalManager` class.  The purpose of this class is to manage rentals and movies allowing users to see the movies available on any given date range,

This class will contain the following attributes:

*   movies:  The list of movies available in the system
*   rentals:  A list of all the rentals which have occurred.

The `RentalManager` will be able to perform the following actions (methods):

*   self.load_movies: This method will open the csv file `movies.csv` and read in the movies and return an array of the given movies.  Note the actors are separated by the `:` character.  You will need to break up that field.
*   available_movies(date_range):  This method will take a `DateRange` instance and return a list of movies available (not rented yet) in that range.
*   rent_movie(movie_title, date_range, customer_name):  This method will attempt to reserve a movie with the given title for the given date range.  If the movie is not available in that range the method should raise a `StandardError`.
  - Note:  This method's tests are not completely written.  You will need to fill-in the provided `it` blocks


## Optional Enhancements

You can add the following methods along with tests to further enhance this project:
-  movies_staring(actor_name, date_range):  This method will list all movies available in the given date range and with the provied actor.
