#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 双六ゲーム
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -t=2,3,7     または -trap=2,3,7 → 2, 3, 7 マス目に落し穴をしかける
  -s=777     または -seed=777 → 乱数の種を指定
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

$trap ||= $t || '2,5,8'
$trap = $trap.split(/,/).map{|s| s.to_i}

$n = ARGV.shift.to_i

#####################################

$goal = $trap.max

$n.times{
  escape = false
  x = 0
  x += rand(6) + 1 until $trap.member?(x) || (escape = (x > $goal))
  puts(escape ? 'X' : 'O')
}
