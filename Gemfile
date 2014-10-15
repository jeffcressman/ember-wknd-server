source 'https://rubygems.org'
ruby "2.1.2"

gem 'rails', '4.1.5'

gem 'rails-api'

gem 'spring', :group => :development

group :development, :test do
  gem 'sqlite3'
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'
end

gem 'rack-cors', :require => 'rack/cors'

gem 'active_model_serializers', '~>0.8.2'

gem 'devise'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
