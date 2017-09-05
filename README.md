# Hotel System

A friend of ours in an heiress and she seeks our assistance in creating a hotel management system. This system will be used primarily by employees working at the front desk as people


## Learning Goals
Reinforce and practice all of the Ruby and programming concepts we've covered in class so far:
- Design a system using object-oriented principles
- Create and instantiate classes with attributes
- Create class and instance methods within our classes
- Write pseudocode and create tests to drive the creation of our code

## Expectations
This project will have requirements that are more open-ended than previous projects you have worked on. This is expected. As this is your final Ruby project, you will be expected to:
- Make decisions on how to structure your classes and methods
- Ask questions when you need clarification
- Understand that the way you implement something may be different than the way your neighbor implements it

## Getting Started
This is a [level 3](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md), individual project.

We will use the same project structure we used for the previous project. Classes should be in files in the `lib` folder, and tests should be in files in the `specs` folder. You should utilize a spec helper file. You will run tests by executing the `rake` command, as configured in a Rakefile. You should have **95% code coverage** using simplecov.

### Setup
1. Fork this repository in GitHub
1. Clone the repository to your computer
1. Create/copy a rakefile to run your tests
1. Open the `specs/spec_helper.rb` file to load your classes and start up simple coverage.  This file will load all the required gems and source files your spec files need so they only need to require the helper.  
    - Each of your spec files should `require_relative` the spec helper file.
1. Create a test to check the instantiation of one of your object types (**RED**)
1. Create the class for the object tested in the step above (**GREEN**)
1. Use git add, commit and push commands to push your initial code to GitHub

### Process
You should use the following process as much as possible:  

1. Write pseudocode
1. Write test(s)
1. Write code

Since this is the **last** Ruby-only project we are doing, and a level 3, the requirements are larger than previous projects. **It is possible you will not be able to complete all requirements**, but if you use the process above, you will still be able to share with your instructors the process and the design you have created.


## Wave One: Initial System Configuration and Setup

### User Stories
- As an administrator, I should be able to access the list of all of the rooms in the hotel
- As an administrator, I should be able to reserve any room for a given date range
- As an administrator, I should be able to access the list of reservations for a specific date
- As an administrator, I should be able to get the total cost for a given reservation

### Assumptions
- There are 20 rooms to start with, and they are numbered 1 through 20
- There is a single room rate of $200/night to start with
- Any room can be reserved at any time (do not worry about whether or not it is available - that's in wave 2!)

### Error Handling Recommendations
- Your code shall raise an error when an invalid date range is provided

## Wave Two: Availability

### User Stories
- As an administrator, I should be able to access the list of rooms that are not reserved for a given date range
- As an administrator, I should be able to reserve an available room for a given date range

### Assumptions


### Error Handling Recommendations
- Your code shall raise an exception when asked to reserve a room that is not available

## Wave Three: Blocks of Rooms

If you are not familiar with what a block of hotel rooms, here is a brief description:

> A Block Booking refers to a group of rooms set aside for a specific customer -- usually for a set period of time.
>
> Room blocks are commonly reserved for conventions and meetings or groups in general. A room block is usually under a firm agreement and is for a set period of time. Rooms blocked are not available for sales to other customers.

### User Stories
- As an administrator, I should be able to create a new block of rooms
  - To create a block you need a date range, collection of rooms and a discounted room rate
  - The collection of rooms should only include rooms that are available for the given date range
- As an administrator, I should be able to check whether a given block has any rooms available
- As an administrator, I should be able to reserve a room from within a block of rooms

### Assumptions
- Assume that a block can be created for a maximum of 5 rooms
- Assume that when a room is reserved from a block of rooms, it will **always** match the date range of the block
- All of the logic from Wave 2 should still work, i.e. individual reservations

### Error Handling Recommendations
- If a room is reserved in a block, it is not available for reservation by the general public

## Optional Requirements
### User Stories
- As an administrator, I should be able to set different rates for different rooms

### Technical
- Read/write CSV files for each piece of data that your system is storing
- Create a CLI to interact with your hotel system
