class Bar
  include Mongoid::Document
  field :name, type: String
  field :street, type: String
  field :city, type: String
  field :zip, type: String
  field :day, type: String
  field :time, type: String
  field :theme, type: String
  field :web, type: String
end
