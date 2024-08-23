require 'minitest/autorun'
require 'timeout'

class CustomerSuccessBalancing
  def initialize(customer_success, customers, away_customer_success)
    @customer_success = customer_success
    @customers = customers
    @away_customer_success = away_customer_success
  end

  # Returns the ID of the customer success with most customers
  def execute
    cs_count = allocate_cs_to_customers
    identify_top_customer_success(cs_count)
  end

  private

  def available_customer_success
    @customer_success.reject { |cs| @away_customer_success.include?(cs[:id]) }
  end

  def sorted_customer_success
    available_customer_success.sort_by! { |cs| cs[:score] }
  end

  def sorted_customers
    @customers.sort_by! { |customer| customer[:score] }
  end

  def allocate_cs_to_customers
    customer_success_list = sorted_customer_success
    customer_list = sorted_customers
    customer_count = Hash.new(0)
    process_customers(customer_success_list, customer_list, customer_count)
    customer_count
  end

  def process_customers(customer_success_list, customer_list, customer_count)
    cs_index = 0
    customer_list.each do |customer|
      cs_index = find_suitable_cs(customer_success_list, cs_index, customer)
      break if cs_index == customer_success_list.size

      increment_customer_count(customer_count, customer_success_list, cs_index)
    end
  end

  def find_suitable_cs(customer_success_list, cs_index, customer)
    while cs_index < customer_success_list.size && customer_success_list[cs_index][:score] < customer[:score]
      cs_index += 1
    end
    cs_index
  end

  def increment_customer_count(customer_count, customer_success_list, cs_index)
    cs_id = customer_success_list[cs_index][:id]
    customer_count[cs_id] += 1
  end

  def identify_top_customer_success(customer_count)
    return 0 if customer_count.empty?

    max_customers_cs = customer_count.max_by { |_, count| count }
    return 0 if customer_count.values.count(max_customers_cs[1]) > 1

    max_customers_cs[0]
  end
end
