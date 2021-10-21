# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 2.6.0'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

gem 'every-politician-scraper', '0.1.2', github: 'tmtmtmtm/every-politician-scraper', branch: 'main'
gem 'open-uri-cached'
gem 'pry'
gem 'rake'
gem 'wikidata_ids_decorator', github: 'everypolitician/wikidata_ids_decorator'

group :test do
  gem 'reek', '~> 6.0'
  gem 'rubocop', '~> 0.89'
end
