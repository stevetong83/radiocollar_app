class ApiV1::PlacesController < Api::V1::ApiController

  def index
    @places = current_user.places.all
  end

  def create

  end

  def show

  end

  def update

  end

  def destroy

  end
end
