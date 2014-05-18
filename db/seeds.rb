# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bar.destroy_all

bars = Bar.create([
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
{name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '34.024743', lon: '-118.491736'},
])