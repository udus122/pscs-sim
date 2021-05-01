#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 各行の長さを数える
(例)
  cat foo.dat | #{name}
(オプション例)
  -help      または -h        → このメッセージを表示
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

#####################################

ARGF.each_line{|s| puts(s.chomp.length)}
