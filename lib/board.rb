# coding: utf-8
class Board
  def initialize n, m
    @n = n
    @m = m
    @buf = Array.new(@n) { ' ' * n }
  end

  def check num
    #                                      n=5, m=3
    re_h = /#{num}{#{@m}}/               # /○{3}/
    re_v = /(#{num}.{#{@n}}){#{@m}}/m    # /(○.){5}/m
    re_d = /(#{num}.{#{@n+1}}){#{@m}}/m  # /(○.){6}/m
    re_r = /(#{num}.{#{@n-1}}){#{@m}}/m  # /(○.){4}/m
    str = @buf.join("\n")+' '*@n
    case str when re_h, re_v, re_d, re_r then
      return true
    else
      return false
    end
  end

  def place n, m, i
    raise 'oob' if n >= @n
    raise 'oob' if m >= @n
    raise 'already' if @buf[n][m] != ' '
    @buf[n][m] = i.to_s
    raise 'win' if check(i)
  end
end
