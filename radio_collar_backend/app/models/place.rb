class Place
  include Mongoid::Document
  
  field :name
  field :lat
  field :long
end
