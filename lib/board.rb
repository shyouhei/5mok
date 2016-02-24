# coding: utf-8
class Board
  def initialize n, m
    @n = n
    @m = m
    @buf = [ ' ' * n ] * n
  end

  def check num
    re_h = /#{num}{#{@m}}/
    re_v = /(#{num}[.¥n]{#{@n}}){#{@m}}/
    re_d = /(#{num}[,¥n]{#{@n+1}}){#{@m}}/
    re_r = /(#{num}[,¥n]{#{@n-1}}){#{@m}}/
    str = buf.join("¥n")+' '*@n
    case str when re_h, re_v, re_d, re_r then
      return true
    else
      return false
    end
  end

  def place n, m, i
    raise 'oob' if n >= @n
    raise 'oob' if m >= @n
    raise 'already' if /0/ !~ @buf[n][m]
    @buf[n][m] = i.to_s
    raise 'win' if check(i)
  end
end
