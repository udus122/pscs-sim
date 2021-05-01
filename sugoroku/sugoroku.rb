#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ��ϻ������
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -t=2,3,7     �ޤ��� -trap=2,3,7 �� 2, 3, 7 �ޥ��ܤ����򤷤�����
  -s=777     �ޤ��� -seed=777 �� ����μ�����
  -help      �ޤ��� -h        �� ���Υ�å�������ɽ��
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$trap ||= $t || '2,5,8'
$trap = $trap.split(/,/).map{|s| s.to_i}

$n = ARGV.shift.to_i

#####################################

$goal = $trap.max

$n.times{
  escape = false
  x = 0
  x += rand(6) + 1 until $trap.member?(x) || (escape = (x > $goal))
  puts(escape ? 'X' : 'O')
}
