#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ɸ�����Ϥ�ɸ����Ϥ�ɸ�२�顼���Ϥإ��ԡ�
(��)
  foo.rb | #{name} | bar.rb
(���ץ������)
  -help      �ޤ��� -h     �� ���Υ�å�������ɽ��
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
