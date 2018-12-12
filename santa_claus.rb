class SantaClaus
  def process(gift)
    return result_for_physical() if gift.is_a? :physical_product
    Result.new()
  end

  def result_for_physical
    puts 'llega aqui?'
    result = Result.new()
    result.generate_for_shipping()
    result
  end
end
