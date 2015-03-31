class Period
  class << self
    def all
      return @all if @all

      start = Date.parse(Setting[:start_date])
      period = Setting[:period].to_s.pluralize.to_sym
      periods = Setting[:periods]

      @all = Array.new(periods) { |i| start.advance(period => i) }
    end
  end
end
