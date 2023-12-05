# README

Sample repository showing how to reproduce https://github.com/rubycdp/ferrum/issues/418.

## Setup

```bash
docker-compose build
docker-compose up -d
docker-compose exec app bash -l -c 'bundle exec rails c'
```

## Reproduce

```bash
# This one is failing
docker-compose exec app bash -l -c 'bundle exec rails runner /rails/bug.rb http://browserless:3000'

# When using host.docker.internal in Docker for Mac, it works
docker-compose exec app bash -l -c 'bundle exec rails runner /rails/bug.rb http://host.docker.internal:3000'
```

## Output

```bash
$ docker-compose exec app bash -l -c 'bundle exec rails runner /rails/bug.rb http://browserless:3000'
Number of sessions (initial): 0
Number of sessions (before browser.quit): 1
Number of sessions (after browser.quit): 1

$ docker-compose exec app bash -l -c 'bundle exec rails runner /rails/bug.rb http://host.docker.internal:3000'
Number of sessions (initial): 0
Number of sessions (before browser.quit): 1
Number of sessions (after browser.quit): 0
```