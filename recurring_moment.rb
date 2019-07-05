require 'active_support'
require 'active_support/core_ext'
require 'byebug'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end


  def match(date)

    current = @start
    array = []
    # advance is a built in ruby method that uses Date to provide precise Time calculations. The options parameter takes a hash with keys years, months, weeks, days, hours, minutes.

    if @period == 'monthly'
      # while current < date, then increase by current.advance(sdfjew) until date is hit
      until current > date do
        current = current.advance(months: @interval)
        if date == current
          return true
        end
        # binding.pry
      end
      return false
      # breaks at feb, instead, use @start and set counter ++
    elsif @period == 'weekly'
      until current > date do
        current = current.advance(weeks: @interval)
        if date == current
          return true
        end
      end
        return false
    elsif @period == 'daily'
      until current > date do
      current = current.advance(days: @interval)
        if date == current
          return true
        end
      end
        return false
    end
  end

# loop through instances of the RecurringMoment
# if loop contains date, then return true
# if an instance of RecurringMoment > date, then break


  #
  #
  #   if current == date
  #     # current < date ||
  #     return true
  #   else return false
  #   end
  # end

end
