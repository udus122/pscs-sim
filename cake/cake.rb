#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ��������ʬ�����򥷥ߥ�졼��
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -s=777     �ޤ��� -seed=777 �� ����μ�����
  -r=5       �ޤ��� -roll=5   �� ���륱������ 5 ʬ��
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

$roll ||= $r || 0
$roll = $roll.to_i

$n = ARGV.shift.to_i

#####################################

def whole()
  a, b = [rand, rand].sort
  you = b - a
  puts you
end

def roll(r)
  s = (1...r).map{rand}.sort
  puts ([0]+s).zip(s+[1]).map{|s,t| t - s}.join(' ')
end

if $roll > 0
  $n.times{roll($roll)}
else
  $n.times{whole}
end
