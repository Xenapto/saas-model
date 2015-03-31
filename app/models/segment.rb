class Segment < ActiveRecord::Base
  include Registerable

  has_many :segment_features

  class << self
    alias_method :register, :fast_register

    def unique_attributes
      [:name]
    end
  end
end
