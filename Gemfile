source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.3'
gem 'settingslogic',              '~> 2.0.9'     # For app-wide settings
gem 'uglifier',                   '>= 1.3.0'
gem 'turbolinks'
gem 'sqlite3'
gem 'jbuilder',                   '~> 1.2'
gem 'haml-rails'

# Assets
gem 'bootstrap-sass',             '>= 3.0.0.0'
gem 'coffee-rails',               '~> 4.0.0'
gem 'compass-rails',              '~> 1.0.3'
gem 'ember-rails'
gem 'ember-source',               '~>1.5.0'
gem 'ember-data-source',          '1.0.0.beta.7'
gem 'hamlbars'                                  # Hamlbars allows Haml support for Handlebars
gem 'ember_script-rails'                        # Coffeescript support for Ember
gem 'font-awesome-rails',         '~> 4.0.3.1'
gem 'jquery-rails',                  '3.0.3' # Ember needs jquery 1.10 or 2.0
gem 'jquery-rails-cdn',           '~> 1.0.1' # Uses CDN for jquery unless in development mode.
gem 'jquery-ui-rails-cdn',        '~> 0.1.2' # Uses CDN for jquery ui unless in development mode.
gem 'oily_png',                   '~> 1.0.2', require: false # Faster sprite generation for Compass
gem 'sass-rails',                 '~> 4.0.0'

# Authentication
gem 'bcrypt-ruby',                '~> 3.1.2'
gem 'cancan'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-identity'
gem 'omniauth-twitter'

gem 'awesome_print',              '~> 1.1.0'  # much improved debugging output

gem 'bootstrap-generators',       '~> 3.1.1'  # Provides rails generators styled for Bootstrap.

gem 'unicorn',                    '~> 4.7.0',  require: false # Use unicorn as the app server

group :development do
  gem 'better_errors'
  gem 'binding_of_caller',        :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'foreman',                  '~> 0.63.0'
  gem 'html2haml'
  gem 'letter_opener',            '~> 1.0.0'  # Open delivered emails in browser
  gem 'quiet_assets'
  gem 'rails_layout'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner',         '1.0.1'
  gem 'email_spec'
  gem 'factory_girl_rails',       '~> 4.1.0'   # Nicer way to generate fixtures
  gem 'timecop',                  '~> 0.5.9.1' # To make tests time independent
  gem 'webmock',                  '~> 1.13.0'  # Prevent calls to external services during tests
end