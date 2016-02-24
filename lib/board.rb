require 'narray'

class NArray
  # hack generate diagonal NArray
  def diag!
    shp = self.shape
    idx = NArray.int(shp[0..1].min).indgen! * (shp[0]+1)
    ref = reshape(shp[0]*shp[1],true)
    ref[idx,true] = 1
    self
  end
end

class Board
  def initialize n, m
    @n = n
    @m = m
    @a = NArray.byte(@n, @n).random
    @pat_h = NArray.byte(@m, @m)
    @pat_v = NArray.byte(@m, @m)
    @pat_d = NArray.byte(@m, @m)
    @pat_h[true, 0] = 1
    @pat_v[0, true] = 1
    @pat_d.diag!
  end

  def check num
    pat_win = NArray.byte(@m).fill(num)
    @n.times do |x|
      break if (i = x + @m) >= @n
      @n.times do |y|
        break if (j = y + @m) >= @n
        sub = @a[x...i, y...j]
        h = sub.mask @pat_h
        v = sub.mask @pat_v
        d = sub.mask @pat_d
        return true if h == pat_win || v == pat_win || i == pat_win
      end
    end
  end

  def place n, m, i
    raise 'oob' if n >= @n
    raise 'oob' if m >= @n
    raise 'already' if @a[n, m] > 0
    @a[n, m] = i
    raise 'win' if check(i)
  end
end
