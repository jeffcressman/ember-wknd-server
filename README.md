# Ember-wknd-server

The Rails API server for [Ember Wknd](https://github.com/jeffcressman/ember-wknd).

Check the [Ember Wknd README](https://github.com/jeffcressman/ember-wknd) for full details.

Work in progress.

## TODO

* add more deployment options via <http://rubber.io>
* add testing

## Resources Used To Build This Application

* Getting familiar with rails-api: <http://railscasts.com/episodes/348-the-rails-api-gem?view=asciicast>
* General Rails knowhow: <http://www.railstutorial.org/book/frontmatter>
* <http://blog.jasonkriss.com/building-an-app-with-ember-app-kit-part-1/>
 <http://blog.jasonkriss.com/building-an-app-with-ember-app-kit-part-2/>
* <http://www.emilsoman.com/blog/2013/05/18/building-a-tested/>
* <http://reefpoints.dockyard.com/2014/05/07/building-an-ember-app-with-rails-part-1.html>
* <http://ember.vicramon.com/>
* <https://github.com/rails-api/rails-api>
* <http://www.html5rocks.com/en/tutorials/cors/>

## How This Application Was Built

```bash
rvm gemset create ember-wknd
rvm gemset use ember-wknd
gem install rails-api
rails-api new ember-wknd-server --skip-sprockets --database=postgresql
```

Add `thin` and `active_model_serializers` to gemfile

Only use Postgress for production.

```ruby
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
```