require 'test_helper'

class TransferTest < ActiveSupport::TestCase
  test "transfer should update user balance immediately" do
    assert_equal 0, users(:trader1).balance(:lreur)

    LibertyReserveTransfer.create!(
      :amount => 10.0,
      :user => users(:trader1),
      :currency => "LREUR",
      :internal => true
    )

    assert_equal 10.0, users(:trader1).balance(:lreur)
  end

  test "bitcoin transfer execution should explode if it is an incoming one" do
    flunk
  end
end
