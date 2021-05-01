#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

include Math

def usage
  name = File::basename $0
  print <<EOU
#{name}: �ݡ��ȥե��ꥪ���ä�
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -t=100     �ޤ��� -turn=100 �� 1 ��� 100 ������
  -q=0.7                      �� �����ϳ�Ψ 0.7 �� 1, ��Ψ 0.3 �� 0 ���Ф�
  -p=0.7                      �� �⻺�� 7 ��� 1 ��, 3 ��� 0 �ˤ�����
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

$turn ||= $t || 100
$turn = $turn.to_i

$q ||= 0.7
$p ||= 0.7
$q = $q.to_f
$p = $p.to_f

$n = ARGV.shift.to_i

module Enumerable
  def sum(&f)
    inject(0){|r, x| r + f.call(x)}
  end
end

#####################################

$rate = 2.0

def trial(t)
  (1..t).sum{
    (rand < $q) ? log10($p) + log10($rate) : log10(1 - $p) + log10($rate)
  }
end

$n.times{puts trial($turn)}
