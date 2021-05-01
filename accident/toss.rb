#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: コイントスのシミュレート
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -p=0.3     または -prob=0.3 → 確率 0.3 で「.」, 確率 0.7 で「o」
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

$prob ||= $p || 0.5
$prob = $prob.to_f

$n = ARGV.shift.to_i

#####################################

$n.times{print(rand < $prob ? 'o' : '.')}
puts
