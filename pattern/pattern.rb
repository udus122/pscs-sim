#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ���ꤷ���ӥåȥѥ����󤬽Ф�ޤ� 0,1 �Υ����������
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -p=1011    �ޤ��� -pattern=1011 �� ��...1011�פ��Ф����Ǥ��ڤ�
  -c=100     �ޤ��� -count=100
    �� �Ǥ��ڤ�ʤ���, Ĺ�� 100 �ޤǤ˻���ѥ����󤬲���Ф����������
  -s=777     �ޤ��� -seed=777 �� ����μ�����
  -v         �ޤ��� -verbatim �� -count ������˥��������ɸ�२�顼���Ϥ�
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

$n = ARGV.shift.to_i

$pattern ||= $p || '11'
$count ||= $c
$count &&= $count.to_i

$verbatim ||= $v

#####################################

$pat = $pattern.split(//).map{|s| s.to_i}
$k = $pattern.length

def trial
  a = []
  a.push(rand(2)) until a[(- $k)..-1] == $pat
  a.join
end

def count
  a = Array::new($count){rand(2)}
  $stderr.puts a.join if $verbatim
  (0...(a.length)).select{|i| a[i, $k] == $pat}.length
end

$n.times{
  puts($count ? count : trial)
}

