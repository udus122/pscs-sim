#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

include Math

def usage
  name = File::basename $0
  print <<EOU
#{name}: ポートフォリオごっこ
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -t=100     または -turn=100 → 1 試行 100 ターン
  -q=0.7                      → くじは確率 0.7 で 1, 確率 0.3 で 0 が出る
  -p=0.7                      → 財産の 7 割を 1 に, 3 割を 0 にかける
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

$turn ||= $t || 100
$turn = $turn.to_i

$q ||= 0.7
$p ||= 0.7
$q = $q.to_f
$p = $p.to_f

$n = ARGV.shift.to_i

module Enumerable
  def sum(&f)
    inject(0){|r, x| r + f.call(x)}
  end
end

#####################################

$rate = 2.0

def trial(t)
  (1..t).sum{
    (rand < $q) ? log10($p) + log10($rate) : log10(1 - $p) + log10($rate)
  }
end

$n.times{puts trial($turn)}
