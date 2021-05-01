#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 指定文字の出現間隔を数える
(例)
  #{name} foo.dat
  echo '....o...o..oo...o.' | #{name}
(オプション例)
  -t='o'  または -target='o'  → 文字「o」の出現間隔を数える
  -help      または -h        → このメッセージを表示
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

$target ||= $t || 'o'

pat = /[#$target][^#$target]*(?=[#$target])/
dat = ARGF.readlines.map{|x| x.chomp}.join

dat.scan(pat){|s| puts s.length}
