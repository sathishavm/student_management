
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
$LOAD_PATH << "#{Rails.root}/lib"
require 'rspec/rails'
require 'rspec/given'
require 'webmock/rspec'
require 'shoulda/matchers'

