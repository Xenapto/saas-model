class SegmentFeature < ActiveRecord::Base
  include Registerable

  belongs_to :segment
  belongs_to :feature

  class << self
    alias_method :register, :fast_register

    def unique_attributes
      [:segment_name, :feature_name]
    end
  end
end
