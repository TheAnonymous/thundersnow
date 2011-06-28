module Thundersnow
  class Bin

    def initialize(args)
      @args = args
    end

    def run
      @weather = Weather.new(location)

      return "Could not locate weather for #{location}" unless @weather.valid?

      if show_forecast?
        show :forecast
      elsif show_forecasteu?
        show :forecasteu
      else
        show :current
      end
    end

  private

    def location
      @args.reject {|a| a =~ /^--/ }[0]
    end

    def show(name)
      @weather.send(name)
    end

    def show_forecast?
      @args.include? '--forecast'
    end
    
    def show_forecasteu?
      @args.include? '--forecasteu'
    end
    
  end
end
