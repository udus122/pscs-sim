#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 指定したビットパターンが出るまで 0,1 のランダム列を作る
(例)
  #{name} 10  → 10 回試行
(オプション例)
  -p=1011    または -pattern=1011 → 「...1011」が出たら打ち切り
  -c=100     または -count=100
    → 打ち切りなしで, 長さ 100 までに指定パターンが何回出たかを数える
  -s=777     または -seed=777 → 乱数の種を指定
  -v         または -verbatim → -count 指定時にランダム列を標準エラー出力へ
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

$n = ARGV.shift.to_i

$pattern ||= $p || '11'
$count ||= $c
$count &&= $count.to_i

$verbatim ||= $v

#####################################

$pat = $pattern.split(//).map{|s| s.to_i}
$k = $pattern.length

def trial
  a = []
  a.push(rand(2)) until a[(- $k)..-1] == $pat
  a.join
end

def count
  a = Array::new($count){rand(2)}
  $stderr.puts a.join if $verbatim
  (0...(a.length)).select{|i| a[i, $k] == $pat}.length
end

$n.times{
  puts($count ? count : trial)
}

