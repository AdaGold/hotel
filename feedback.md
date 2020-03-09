# Hotel

<!--

################
NOTE ABOUT HOTEL
################

Section 1: Major Learning Goals

  - Complete this section by skimming through the code and looking for "red flags." (For example, not having instance methods is a red flag. Having a class that is too big is a red flag.)

Section 2: Code Review and Testing Requirements

  - Complete this section by skimming through the code and looking for the syntax that fulfills the requirement. If you can't find this requirement, then it's a no. These are written to be as yes/no as possible.

Section 3: Feature Requirements

  - Complete this section by skimming through the test names, first. In the ideal world, you'd be able to find all of the answers by looking through the tests. Please note that each requirement is phrased as "There is a method that..." which is also ideal/likely for our students, but isn't guaranteed.

  - Dee's note: I didn't add in all of the features that were required by the project; the project reqs not represented on this rubric are:
    - Wave 1: Invalid date range produces an error
    - Wave 2: Reserving a room that is not available produces an error
    - Wave 3: Check if a block has rooms
-->


<!-- Instructors: The checkmarks are already there, so just delete them for any line items that aren't met. -->

## Section 1: Major Learning Goals

<!-- Instructors: Feel free to practice creating specific feedback by referencing a line of code if you'd like. For example, you may say something like "nice custom method in `calculator.rb` line 42." This is optional. -->

| Criteria | yes/no, and optionally any details/lines of code to reference |
| --- | --- |
Practices SRP by having at least two separate classes with distinct responsibilities, and test files for these two classes | ✔️
Overall, demonstrates understanding instance variables vs. local variables. (There aren't unnecessarily too many instance variables, when it should be a local variable) | ✔️
For each test file, tests demonstrate an understanding of instantiating objects properly, and using Arrange-Act-Assert | ✔️
Practices pseudocode and TDD, and reflected on it by filling out the reflection questions | ✔️
Practices git with at least 15 small commits and meaningful commit messages | ✔️

## Section 2: Code Review and Testing Requirements

| Criteria | yes/no, and optionally any details/lines of code to reference |
| --- | --- |
There is a class that represents a reservation, and a second class that holds/manages a collection of reservations through composition (instance variable) | ✔️
The logic for checking if a reservation's date overlaps with another reservation's date is complex logic that is separated into method(s) (and potentially class(es)) | ✔️
The logic for checking if a reservation's date overlaps with another reservation's date has unit tests | ✔️
All of the given tests run and pass | ✔️
A test coverage tool is installed and used, and shows 95% test coverage | ✔️

## Section 3: Feature Requirements

| Feature Requirement: There is a method that... | yes/no |
| --- | --- |
gives back a list of rooms, and it's tested | ✔️
creates a specific reservation for a room for a given date range, and it has nominal test cases | ✔️
creates a specific reservation for a room for a given date range, and it tests an edge case, such as no available room, or invalid date range | ✔️
gives back a list of reservations on a given date. Its tests include a test that makes several reservations for a given date | ✔️
calculates the total price for a reservation | ✔️
gives back a list of available rooms for a given date range, and it has nominal test cases | ✔️
gives back a list of available rooms for a given date range, and it has edge test cases, such as no available room, or invalid date range | ✔️
creates a block of rooms | ✔️
reserves a room from a block | ✔️

## Overall Feedback

| Overall Feedback | Criteria | yes/no |
| --- | --- | --- |
| Green (Meets/Exceeds Standards) | 14+ total in all sections | 
| Yellow (Approaches Standards) | 9-13 total in all sections | 
| Red (Not at Standard) | 0-8 total in all sections, or assignment is breaking/doesn’t run with less than 5 minutes of debugging | 

### Additional Feedback

<!--

######
PLEASE
######

Instructors, for Hotel, please give explicit positive feedback.

-->

Great work overall! You've built your first project with minimal starting code. This represents an incredible milestone in your journey, and you should be proud of yourself! 

I am particularly impressed by the way that you...

I do see some room for improvement around...

## Code Style Bonus Awards

<!-- Instructors: Please strike a balance between liberal/stingy with these. These are simply built-in pieces of positive feedback; use this to encourage and push students towards a cleaner code style! -->

Was the code particularly impressive in code style for any of these reasons (or more...?)

| Quality | Yes? |
| --- | --- |
| Perfect Indentation | ✅
| Elegant/Clever | ✅
| Descriptive/Readable | ✅
| Concise | ✅
| Logical/Organized | ✅
