# Hotel Design Scaffolding

## How to Read This Scaffolding to Create a Second Draft

This scaffolding is one solution that answers some of the initial questions about how project files can be laid out.

Use [this view of our branch on GitHub.com](https://github.com/AdaGold/hotel/tree/design-scaffolding) to explore the files that exist on this repo.
  - What classes exist?
    - Why? What are they named, what do they represent, and what state and behavior do they have?
  - What tests exist?
  - What parts of this design inspires you, and you want to steal?
  - What parts of this design are you unsure about, and need to consider again later?
  - What parts of this design do you think you can do without?
  
Spend **no more than 1 hour** answering those questions and adjusting your project's first draft design. After one hour, get started; don't forget that a useful skill for the programmer is the ability to get started, and adjust in small ways often.

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

You can use this code either as inspiration, or as a starting point. If using it as an inspiration, it follows our standard project layout, with product code under `lib/` and tests under `test/`.

If you choose to use the code on this branch as a starting point, you can either:

1. Copy and paste each file from this project into your existing `hotel` folder
2. Or start your project anew with the following steps:

    ```
    $ git clone <paste forked repo URL>
    $ cd hotel
    $ git merge origin/design-scaffolding
    ```

    - Note: You can try to merge in the design scaffolding after you've started, but you'll probably end up with merge conflicts. See an instructor if you're not able to resolve them yourself.
