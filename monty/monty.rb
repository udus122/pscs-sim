#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ���ƥ��ۡ�������򥷥ߥ�졼��
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -c         �ޤ��� -change   �� �䥮�򸫤�����Ѥ���
  -s=777     �ޤ��� -seed=777 �� ����μ�����
  -help      �ޤ��� -h        �� ���Υ�å�������ɽ��
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$change ||= $c

$seed ||= $s
srand($seed.to_i) if $seed

$n = ARGV.shift.to_i

def choice(a)
  a[rand(a.length)]
end

#####################################

$doors = 'ABC'.split //
$n.times{
  car = choice $doors
  you = choice $doors
  goat = choice($doors - [car, you])
  you = choice($doors - [you, goat]) if $change
  result = (car == you) ? 'O' : 'X'
  puts result
}
