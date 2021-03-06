# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  There are three models, Student, Instructor and Course
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  Students have many Courses, Instructors have many Courses, and Instructors have many Students through Courses.
- [x] Include user accounts
  Students have user accounts.
- [x] Ensure that users can't modify content created by other users
  Students can only alter their own registration. Admin can alter everything.
- [x] Include user input validations
  They prevent erroneous email entries, lack of names for new objects.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
  There are flash errors for every route.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
