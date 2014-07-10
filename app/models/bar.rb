class Bar
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  geocoded_by :full_address
  after_validation :geocode 

  field :name, type: String
  field :full_address, type: String
  field :phone, type: String
  field :day, type: String
  field :time, type: String
  field :theme, type: String
  field :web, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  field :coordinates, type: Array
  


end
