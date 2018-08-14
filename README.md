# zombie-survival-sn

[![Codeship Status for thdurante/zombie-survival-sn](https://app.codeship.com/projects/232ce7c0-7bf0-0136-ab15-728091df58cc/status?branch=master)](https://app.codeship.com/projects/300843)
[![codecov](https://codecov.io/gh/thdurante/zombie-survival-sn/branch/master/graph/badge.svg?token=O5uVeThz0g)](https://codecov.io/gh/thdurante/zombie-survival-sn)

Zombie Survival Social Network API. [Detailed Description](https://gist.github.com/akitaonrails/711b5553533d1a14364907bbcdbee677)

## Setup

In the project's root directory:
```
$ bin/setup
OR
$ bundle install
$ rails db:create db:migrate
```
Ruby: `2.5.1`
Rails: `5.2.0`

## Run

In the project's root directory:
```
$ bundle exec rails s
```

## Test

In the project's root directory:
```
$ [coverage=on] bundle exec rspec
```
Where `coverage=on` is optional and determines whether or not the coverage report must be generated.

## Docs

The application docs can be found [here.](https://zssn-staging.herokuapp.com/)
