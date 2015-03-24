class Segment < ActiveRecord::Base
  include Registerable

  has_many :segment_features

  class << self
    alias_method :register, :fast_register

    def unique_attributes
      [:name]
    end

    def generate_segment_features
      all.try(:each) do |s|
        Feature.all.try(:each) do |f|
          attributes = {
            segment_id: s.id,
            feature_id: f.id,
            segment_name: s.name,
            feature_name: f.name
          }

          SegmentFeature.register attributes
        end
      end
    end
  end
end
