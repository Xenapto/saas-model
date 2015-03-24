class Setting < ActiveRecord::Base
  class << self
    def [](key)
      YAML.load(where(key: key).first.try(:value) || '')
    end

    def []=(key, value)
      s = where(key: key).first_or_create.lock!
      s.value = value.to_yaml
      s.save
    end
  end
end
