class Bar
  include Mongoid::Document
  field :biz_id, type: Integer
  field :name, type: String
  field :street, type: String
  field :city_state_zip, type: String
  field :day, type: String
  field :time, type: String
  field :theme, type: String
  field :web, type: String
  field :lat, type: String
  field :lon, type: String
end
