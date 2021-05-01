#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ������ȥ��Υ��ߥ�졼��
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -p=0.3     �ޤ��� -prob=0.3 �� ��Ψ 0.3 �ǡ�.��, ��Ψ 0.7 �ǡ�o��
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

$prob ||= $p || 0.5
$prob = $prob.to_f

$n = ARGV.shift.to_i

#####################################

$n.times{print(rand < $prob ? 'o' : '.')}
puts
