class ModelController < ApplicationController
  def index
    @features = Feature.all
    @segments = Segment.all
  end
end
