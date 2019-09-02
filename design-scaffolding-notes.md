# Hotel Design Scaffolding

## Purpose

This scaffolding is intended for students who are feeling overwhelmed by the open-ended nature of the Hotel project. Its goal is to answer some of the initial questions about how project files should be laid out, so that students can focus on designing the object interactions and complex Ruby logic that are the core learning goals of the project. The hope is to do so without removing too much of the interesting design work.

This document and the associated code is intended to be student-facing - if you have a student you think would benefit from this, send them a link!

### What it includes

- Three class stubs, `HotelController`, `Reservation` and `DateRange`
- Stubs for public methods of each class from waves 1 and 2, as described in the user stories
- "Interface" tests for each class method that invoke it with the right parameters and verify the return type
- Full test stubs for the `DateRange` class

### What it does not include

- Opinions about how classes should interact or data should be stored
- Opinions about whether there should be a `Room` class, or whether it should know about `Reservation`s
- Private helper methods to keep code organized

Students should feel free to modify any code as they see fit, including changing method signatures, adding new classes and methods, reordering things, not looking at the `DateRange` tests because they want to give it a shot on their own, etc. 

## How to use this code

Design scaffolding code lives on the `design-scaffolding` branch.

You can use this code either as inspiration, or as a starting point. If using it as an inspiration, it follows our standard project layout, with product code under `lib/` and tests under `spec/`.

If you choose to use the code on this branch as a starting point, follow these steps to start your project:

```
$ git clone <paste forked repo URL>
$ cd hotel
$ git merge origin/design-scaffolding
```

You can try to merge in the design scaffolding after you've started, but you'll probably end up with merge conflicts. See an instructor if you're not able to resolve them yourself.
