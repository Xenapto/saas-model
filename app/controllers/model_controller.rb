class ModelController < ApplicationController
  def index
    @features = Feature.all
    @segments = Segment.all
    @segment_features = SegmentFeature.all
    @settings = Setting.all
  end
end
