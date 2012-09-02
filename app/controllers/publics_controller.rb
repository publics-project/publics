class PublicsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @publics = Public.all
  end
end