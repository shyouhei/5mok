require_relative 'test_helper'
require_relative '../lib/board'

class Test01Scenario < Test::Unit::TestCase

  def test_win
    assert_raise_message('win') do
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
    assert_raise_message('oob') do
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
    assert_raise_message('already') do
      b =  Board.new(5, 3)
      [
        0,0,1,
        1,1,2,
        1,0,1,
        3,2,2,
        1,1,1,
        #5,5,2,
        #2,0,1,
      ].each_slice(3) {|n, m, i|
        b.place(n, m, i)
      }
    end
  end

  def test_win_r
    assert_raise_message('win') do
      b =  Board.new(5, 3)
      [
        4,0,1,
        0,0,2,
        3,1,1,
        0,1,2,
        2,2,1,
      ].each_slice(3) {|n, m, i|
        b.place(n, m, i)
      }
    end
  end
end
