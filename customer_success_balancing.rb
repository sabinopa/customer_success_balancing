require 'minitest/autorun'
require 'timeout'

class CustomerSuccessBalancing

  def initialize(customer_success, customers, away_customer_success)
    @customer_success = customer_success
    @customers = customers
    @away_customer_success = away_customer_success
  end

  def execute
    allocated_customers = allocate_customers_to_cs
    identify_top_customer_success(allocated_customers)
  end

  private

  def allocate_customers_to_cs
    customer_index = 0
    customer_count = sorted_customer_list.size
    allocated_customers = Hash.new(0)

    sorted_customer_success_list.each do |current_cs|
      while more_customers_to_allocate?(customer_index, customer_count, current_cs)
        allocated_customers[current_cs[:id]] += 1
        customer_index += 1
      end
    end

    allocated_customers
  end

  def sorted_customer_list
    @sorted_customer_list ||= sort_by_score(@customers)
  end

  def sorted_customer_success_list
    @sorted_customer_success_list ||= sort_by_score(available_customer_success)
  end

  def sort_by_score(list)
    list.sort_by! { |entity| entity[:score] }
  end

  def available_customer_success
    @customer_success.reject { |cs| @away_customer_success.include?(cs[:id]) }
  end

  def more_customers_to_allocate?(customer_index, customer_count, current_cs)
    customer_index < customer_count && sorted_customer_list[customer_index][:score] <= current_cs[:score]
  end

  def identify_top_customer_success(allocated_customers)
    return 0 if allocated_customers.empty?

    max_customers_cs = allocated_customers.max_by { |_, count| count }
    return 0 if top_cs_draw?(allocated_customers, max_customers_cs)

    max_customers_cs.first
  end

  def top_cs_draw?(allocated_customers, max_customers_cs)
    allocated_customers.values.count(max_customers_cs[1]) > 1
  end
end
