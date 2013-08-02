require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Good.new.valid?
  end
end
