#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ランダムに打った点の最短距離を調べる
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -s=777     または -seed=777   → 乱数の種を指定
  -d=20      または -dim=20     → 20 次元空間
  -p=100     または -points=100 → 点を 100 個打つ
  -help      または -h          → このメッセージを表示
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$dim ||= $d || 20
$dim = $dim.to_i

$points ||= $p || 100
$points = $points.to_i

$n = ARGV.shift.to_i

#####################################

def smaller(x, y)
  x < y ? x : y
end

module Enumerable
  def sum(&f)
    inject(0){|r, x| r + f.call(x)}
  end
  def minimum(&f)
    inf = 1.0/0
    inject(inf){|r, x| smaller r, f.call(x)}
  end
end

def distance(u, v)
  u.zip(v).sum{|x, y| (x - y)**2} ** 0.5
end

def random_point
    (1..$dim).map{rand}
end

def nearest
  u = random_point
  (2..$points).minimum{distance u, random_point}
end

$n.times{puts nearest}
