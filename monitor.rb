#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 標準入力を標準出力と標準エラー出力へコピー
(例)
  foo.rb | #{name} | bar.rb
(オプション例)
  -help      または -h     → このメッセージを表示
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

ARGF.each_line{|line|
  puts line
  $stderr.puts line
}
