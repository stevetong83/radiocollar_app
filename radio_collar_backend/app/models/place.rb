class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :lat
  field :long
  field :location_url

  belongs_to :user

  validates :name, :lat, :long, presence: true

  def self.set_map_url(name, lat, long)
    google_url = "http://maps.google.com/maps?q=#{lat},+#{long}+(#{name})"
    radiocollar_url = MongoidShortener.generate(google_url)
  end

end
