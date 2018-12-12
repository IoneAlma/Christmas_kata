class Result
  def membership
    Membership.new()
  end

  def packing_slip
    @packing_slip
  end

  def duplicate
    PackingSlip.new()
  end

  def generate_for_shipping
    @packing_slip = PackingSlip.new()
  end
end
