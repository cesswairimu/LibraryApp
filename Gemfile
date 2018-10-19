source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem "recaptcha", require: "recaptcha/rails"
gem 'jquery-rails'
gem 'faker'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'foundation-rails'
gem 'breadcrumbs_on_rails'
gem 'listen', '~> 3.0.5'
gem 'elasticsearch-model', git: 'git://github.com/elastic/elasticsearch-rails.git', branch: 'master'
gem 'elasticsearch-rails', git: 'git://github.com/elastic/elasticsearch-rails.git', branch: 'master'


group :development, :test do
  gem 'byebug', platform: :mri
gem 'sqlite3'
gem 'spring'
gem 'rails-controller-testing'
end

group :development do
  gem 'guard'
  gem 'guard-minitest'
  gem 'guard-rails'
  gem 'guard-bundler'
  gem 'web-console'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'launchy'
end
group :test do
gem 'minitest-reporters'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
	gem 'pg'
end
