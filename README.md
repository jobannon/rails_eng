# README

# Ruby version This is compatible with 
  -Ruby 2.5.1 
  -Rails 5.1.7

# System dependencies 
  1. Requires the Fastapi (install 'gem FastApi')
  2. Please update your gemfile under test and development

# Configuration 
  1. Setup Fast Api 
  2. Setup Factory_bot

# Database creation 
1. Create the database 
rails {db:drop,create,migrate,seed} 
2. Import the data 
(this rake file located under tasks.  The data is located under data/ folder)
rake import:all_import   

# How to run the test suite 
1. bundle exec rspec


