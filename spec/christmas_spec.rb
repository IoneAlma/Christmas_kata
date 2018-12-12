require_relative '../santa_claus'
require_relative '../packing_slip'
require_relative '../gift'
require_relative '../membership'
require_relative '../result'

describe 'SantaClaus parsing a gift list'  do
  before do
    @santa = SantaClaus.new()
  end

  it 'If the gift is for a physical product, generate a packing slip for shipping' do
    gift = Gift.new(:physical_product)
    result = @santa.process(gift)

    expect(result.packing_slip.for_shipping?).to be true

    another_gift = Gift.new(:non_physical_product)
    result = @santa.process(another_gift)
    puts result.packing_slip
    expect(result.packing_slip.for_shipping?).to be false

  end

  xit 'If the gift is for a book, create a duplicate packing slip for the Good Childrens department' do
    gift = Gift.new(:book)
    result = @santa.process(gift)

    expect(result.duplicate.for_good?).to be true
  end

  xit 'If the gift is for a Netflix membership, activate that membership.' do
    gift = Gift.new(:netflix_membership)
    result = @santa.process(gift)

    expect(result.membership.is_active?).to be true
  end

  it 'If the gift is an upgrade to a Netflix membership, apply the upgrade.' do
    gift = Gift.new(:netflix_membership_upgrade)
    result = @santa.process(gift)

    expect(result.membership.is_upgraded?).to be true
  end
end
