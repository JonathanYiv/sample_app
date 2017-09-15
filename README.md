# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).

## Learned

### Chapter 3: Static Pages

1. There is a command to generate controllers:

```ruby
$ rails generate controller ControllerName <optional action names>
```

2. New Routes are defined in /config/routes.rb

3. Rails views can contain static HTML and/or ERb (Embedded Ruby).

4. Testing can drive development of new features, allow for refactoring, and catch regressions.

5. Rails Layouts allow a common template for pages in our application to make things DRY.

### Chapter 4: Rails-Flavored Ruby

