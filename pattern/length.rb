#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: �ƹԤ�Ĺ���������
(��)
  cat foo.dat | #{name}
(���ץ������)
  -help      �ޤ��� -h        �� ���Υ�å�������ɽ��
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

#####################################

ARGF.each_line{|s| puts(s.chomp.length)}
