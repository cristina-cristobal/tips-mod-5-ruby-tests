require 'active_support'
require 'active_support/core_ext'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end


  def match(date)

    current = @start

    # advance is a built in ruby method that uses Date to provide precise Time calculations. The options parameter takes a hash with keys years, months, weeks, days, hours, minutes.
    
    if @period == 'monthly'
      current = current.advance(weeks: @interval)
    elsif @period == 'weekly'
      current = current.advance(months: @interval)
    elsif @period == 'daily'
      current = current.advance(days: @interval)
    end

    if current < date || current == date
      return true
    else return false
    end
  end


end
