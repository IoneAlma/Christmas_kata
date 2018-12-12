class Gift
  def initialize(description)
    @description = description
  end

  def is_a? description
    puts description
    puts @description
    @description == description
  end
end
