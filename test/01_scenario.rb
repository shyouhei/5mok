require_relative 'test_helper'

class Test01Scenario < Test::Unit::TestCase

  def test_win
    assert_raises(RuntimeError, 'win') do
      b =  Board.new(5, 3)
      [
        0,0,1,
        1,1,2,
        1,0,1,
        3,2,2,
        #1,1,1,
        #5,5,2,
        2,0,1,
      ].each_slice(3) {|n, m, i|
        b.place(n, m, i)
      }
    end
  end

  def test_oob
    assert_raises(RuntimeError, 'oob') do
      b =  Board.new(5, 3)
      [
        0,0,1,
        1,1,2,
        1,0,1,
        3,2,2,
        #1,1,1,
        5,5,2,
        #2,0,1,
      ].each_slice(3) {|n, m, i|
        b.place(n, m, i)
      }
    end
  end

  def test_already
    assert_raises(RuntimeError, 'already') do
      b =  Board.new(5, 3)
      [
        0,0,1,
        1,1,2,
        1,0,1,
        3,2,2,
        #1,1,1,
        5,5,2,
        #2,0,1,
      ].each_slice(3) {|n, m, i|
        b.place(n, m, i)
      }
    end
  end
end
