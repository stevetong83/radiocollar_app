class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :lat
  field :long

  belongs_to :user
end
