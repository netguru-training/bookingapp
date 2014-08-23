class SearchController < ApplicationController
  def index
    @places = Place.where("to_tsvector('english', name) @@ plainto_tsquery('english', :q)", q: params[:query][:query])
  end
end
