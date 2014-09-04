For polymorphic seed data we would do something like this:

user.profile.create! room: 'the_room_id'

```bash
rails-api g model User name:string email:string password:string
rails-api g serializer User
rails-api g model GuestProfile
rails-api g serializer GuestProfile
rails-api g model SpeakerProfile bio:string
rails-api g serializer SpeakerProfile
rails-api g model HostProfile
rails-api g serializer HostProfile
rails-api g migration add_profile_to_users profile_id:integer profile_type
rails-api g model Workshop name:string description:string
rake db:migrate
```

To generate our associations we would have created the User like so:

`rails g model User name:string email:string password:string profile:references{polymorphic}`

and the profiles like so:

`rails g model GuestProfile user:references`


Because we didn't use t.references when generating we'll have to add any associations to the db schema AFTER we add them to the models.

We can add these by updating the User table like so:

`rails-api g migration AddProfileToUsers profile:references{polymorphic}`

and our profile tables like so:

`rails-api g migration AddUserIdToGuestProfile user_id:integer`

So this looks like when we create the controller we create a User object and the profile at the same time.

```ruby
class GuestProfilesController < ApplicationController
  def create
    guest = User.create! { |u| u.profile = GuestProfile.create! }
    session[:user_id] = guest.id
    redirect_to root_url
  end
end
```