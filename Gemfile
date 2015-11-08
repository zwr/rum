source 'https://rubygems.org'

# general Rails gems
gem 'rails', '4.2.3'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

# Authentication and OAuth provider
gem 'devise'
gem 'doorkeeper'

# Our usual gems
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'puma', platforms: :ruby
gem 'haml-rails'
gem 'redcarpet'
gem 'paperclip'
gem 'html2haml'

group :development, :test do
  # following makes sure we use old parser - this might be a problem and should
  # be removed if it becomes a problem. The reason it is here is that newer
  # parser shows an annoying message about Ruby MRI.
  gem 'parser', '2.2.2.5'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rspec-rails'
  gem 'spring'
  gem 'rubocop'
  gem 'pry-rails'
end
