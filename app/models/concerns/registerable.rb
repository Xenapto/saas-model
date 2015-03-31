module Registerable
  extend ActiveSupport::Concern

  module ClassMethods
    # Register a new record or return an existing one. This version will work
    # in a highly-concurrent environment where multiple process are updating
    # this model, but it's slower than `fast_register`.
    def safe_register(attributes = {})
      begin
        create! unique_values(attributes)
      rescue ActiveRecord::RecordNotUnique
        where(unique_values(attributes)).first
      end.update attributes
    end

    # Register a new record or return an existing one. This version will work
    # in a low-concurrency environment where we can assume that only this
    # process is updating the model at any given time. This version is faster
    # than `safe_register` but not as safe from race conditions.
    def fast_register(attributes = {})
      instances = where(unique_values(attributes)) # should be one or zero
      instances.present? ? instances.first.update(attributes) : create!(attributes)
    end

    # The model using these methods must define a `unique_attributes` method
    # that returns an array of the attributes of the model's unique key, i.e. a
    # set of columns that will return zero or one rows when used in a WHERE
    # clause. Example:
    #
    # <code>
    # def self.unique_attributes
    #   %i(name category)
    # end
    # </code>
    def unique_values(attributes)
      attributes.slice(*unique_attributes)
    end
  end
end
