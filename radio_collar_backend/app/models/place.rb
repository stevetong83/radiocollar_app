class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :lat
  field :long

  belongs_to :user

  validates :name, :lat, :long, presence: true
end
