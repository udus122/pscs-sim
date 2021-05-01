#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ����ʸ���νи��ֳ֤������
(��)
  #{name} foo.dat
  echo '....o...o..oo...o.' | #{name}
(���ץ������)
  -t='o'  �ޤ��� -target='o'  �� ʸ����o�פνи��ֳ֤������
  -help      �ޤ��� -h        �� ���Υ�å�������ɽ��
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
