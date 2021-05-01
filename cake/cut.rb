#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: �ƹԤλ���ե�����ɤ�ɽ��
(��)
  #{name} -f=2 foo.dat
(���ץ������)
  -field=1   �ޤ��� -f=1   �� �� 1 �ե�����ɤ�ɽ��
  -help      �ޤ��� -h     �� ���Υ�å�������ɽ��
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
