#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 各行の指定フィールドを表示
(例)
  #{name} -f=2 foo.dat
(オプション例)
  -field=1   または -f=1   → 第 1 フィールドを表示
  -help      または -h     → このメッセージを表示
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

$field ||= $f || 1
$field = $field.to_i

ARGF.each_line{|s| puts s.chomp.split(/\s+/)[$field - 1]}
