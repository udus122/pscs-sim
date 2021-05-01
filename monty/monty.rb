#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: モンティホール問題をシミュレート
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -c         または -change   → ヤギを見て扉を変える
  -s=777     または -seed=777 → 乱数の種を指定
  -help      または -h        → このメッセージを表示
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$change ||= $c

$seed ||= $s
srand($seed.to_i) if $seed

$n = ARGV.shift.to_i

def choice(a)
  a[rand(a.length)]
end

#####################################

$doors = 'ABC'.split //
$n.times{
  car = choice $doors
  you = choice $doors
  goat = choice($doors - [car, you])
  you = choice($doors - [you, goat]) if $change
  result = (car == you) ? 'O' : 'X'
  puts result
}
