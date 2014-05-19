# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bar.destroy_all

bars = Bar.create([
{biz_id: 0, name: 'results[@bar.biz_id].name', day: 'tuesday', time: '8:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 1, name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 2, name: '', day: 'sunday', time: '8:00pm', theme: 'sports', web: '', lat: '', lon: ''},
{biz_id: 3, name: '', day: 'monday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 4, name: '', day: 'sunday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 5, name: '', day: 'tuesday', time: '8:00pm', theme: 'entertainment', web: '', lat: '', lon: ''},
{biz_id: 6, name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 7, name: '', day: 'wednesday', time: '8:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 8, name: '', day: 'thursday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 9, name: '', day: 'tuesday', time: '8:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 10, name: '', day: 'wednesday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 11, name: '', day: 'monday', time: '8:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 12, name: '', day: 'sunday', time: '7:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 13, name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},
{biz_id: 14, name: '', day: 'tuesday', time: '9:00pm', theme: 'general', web: '', lat: '', lon: ''},

])