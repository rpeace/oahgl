# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'active_record/fixtures'

Item.delete_all
Hero.delete_all
Performance.delete_all
Player.delete_all
Team.delete_all
Match.delete_all
Series.delete_all
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/db/seeds", ["items","players","heros","matches","performances","series","teams"])