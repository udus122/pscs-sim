#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ケーキの分け前をシミュレート
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -s=777     または -seed=777 → 乱数の種を指定
  -r=5       または -roll=5   → ロールケーキの 5 分割
  -help      または -h        → このメッセージを表示
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$roll ||= $r || 0
$roll = $roll.to_i

$n = ARGV.shift.to_i

#####################################

def whole()
  a, b = [rand, rand].sort
  you = b - a
  puts you
end

def roll(r)
  s = (1...r).map{rand}.sort
  puts ([0]+s).zip(s+[1]).map{|s,t| t - s}.join(' ')
end

if $roll > 0
  $n.times{roll($roll)}
else
  $n.times{whole}
end
