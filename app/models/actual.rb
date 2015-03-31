class Actual < ActiveRecord::Base
  include Registerable

  class << self
    alias_method :register, :fast_register

    def unique_attributes
      [:period]
    end

    def generate
      Period.all.try(:each) { |p| register(period: p) }
    end
  end
end
