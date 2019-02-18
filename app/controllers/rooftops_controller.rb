class RooftopsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @rooftops = Rooftop.all
  end
end
