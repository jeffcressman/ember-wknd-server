# Ember-wknd-server

The Rails API server for [Ember Wknd](https://github.com/jeffcressman/ember-wknd).

Check the [Ember Wknd README](https://github.com/jeffcressman/ember-wknd) for full details.

Work in progress.

## TODO

* CRUD for guests, speakers, and workshops
* register for a workshop
* add authentication
* add Heroku deployment option
* add more deployment options via <http://rubber.io>
* add tests

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

## Notes

User:           name, email, password
Guest:          has_many registrations
Speaker:        bio, has_many workshops, create workshops
Host:           can create and edit Speakers
Workshop:       name, description, speaker
Registration:   name, guest, workshop

## How This Application Was Built

```bash
rvm gemset create ember-wknd
rvm gemset use ember-wknd
echo "rvm ruby-2.1.2@ember-wknd" >> .rvmrc
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

Implemented using Single Table Inheritance (STI)

```bash
rails-api g model User name:string email:string password:string type:string
rails-api g serializer User
rails-api g model Guest --parent user
rails-api g serializer Guest
rails-api g model Speaker --parent user
rails-api g migration AddBioToUsers bio:string
rails-api g serializer Speaker
rails-api g model Host --parent user
rails-api g serializer Host
rails-api g model Workshop name:string description:string
rails-api g serializer Workshop
rails-api g model Registration guest:string workshop:string
rails-api g serializer Registration
rails-api g migration AddGuestRefToRegistrations guest:references
rails-api g migration AddWorkshopRefToRegistration workshop:references
rails-api g migration AddSpeakerRefToWorkshops speaker:references
rake db:migrate
```
Could probably also have done `rails g scaffold Comment post:references` to add the belongs_to relationship.