# coding: utf-8
require_relative 'lib/board'
require 'scanf'

n, m = STDIN.scanf('%d%d')
b = Board.new(n, m)
[1, 2].cycle.each do |x|
  y, z = STDIN.scanf('%d%d')
  begin
    b.place y, z, x
  rescue => e
    raise e
    case e.massage
    when /win/ then
      puts '勝ちです'
    when /oob/ then
      puts '範囲外です'
    when /already/ then
      puts 'すでに石があります'
    end
  end
end
