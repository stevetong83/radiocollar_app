class ApiV1::PlacesController < ApplicationController

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
