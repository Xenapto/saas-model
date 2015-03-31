class SegmentFeature < ActiveRecord::Base
  include Registerable

  belongs_to :segment
  belongs_to :feature

  class << self
    alias_method :register, :fast_register

    def unique_attributes
      [:segment_name, :feature_name]
    end

    def generate
      Segment.all.try(:each) do |s|
        Feature.all.try(:each) do |f|
          register(
            segment_id: s.id,
            feature_id: f.id,
            segment_name: s.name,
            feature_name: f.name
          )
        end
      end
    end
  end
end
