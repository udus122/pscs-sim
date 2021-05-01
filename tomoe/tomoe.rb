#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ともえ戦
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -p=60,40,70 または -prob=60,40,70
    → A は B に確率 60% で勝ち, B は C に確率 40% で勝ち,
       C は A に確率 70% で勝つ
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

$prob ||= $p || '50,50,50'
$prob = $prob.split(/,/).map{|s| s.to_f / 100}

$n = ARGV.shift.to_i

#####################################

ab, bc, ca = $prob
$p_table = {
  :A => {:B => ab, :C => 1 - ca},
  :B => {:C => bc, :A => 1 - ab},
  :C => {:A => ca, :B => 1 - bc},
}

def fight(x, y)
  rand < $p_table[x][y] ? [x, y] : [y, x]
end

def trial
  history = []
  x, y, z = [:A, :B, :C]
  begin
    winner, loser = fight x, y
    history.unshift winner
    x, y, z = [winner, z, loser]
  end until history[0] == history[1]
  history[0]
end

$n.times{puts trial}
