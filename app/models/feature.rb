class Feature < ActiveRecord::Base
  include Registerable

  class << self
    alias_method :register, :fast_register

    def unique_attributes
      [:name]
    end
  end
end
