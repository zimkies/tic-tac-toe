# README

To setup:

```
bundle install
bundle exec rake db:setup
```

To test:
```
bundle exec rspec
```

# TODO
- move board error validation into the search strategy logic
- Add more strategy specs
- Perhaps convert internal representation of board to use arrays of arrays.
- Speed up DFS by permanently caching results somewhere
