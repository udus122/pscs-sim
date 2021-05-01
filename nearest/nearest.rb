#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: ��������Ǥä����κ�û��Υ��Ĵ�٤�
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -s=777     �ޤ��� -seed=777   �� ����μ�����
  -d=20      �ޤ��� -dim=20     �� 20 ��������
  -p=100     �ޤ��� -points=100 �� ���� 100 ���Ǥ�
  -help      �ޤ��� -h          �� ���Υ�å�������ɽ��
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$dim ||= $d || 20
$dim = $dim.to_i

$points ||= $p || 100
$points = $points.to_i

$n = ARGV.shift.to_i

#####################################

def smaller(x, y)
  x < y ? x : y
end

module Enumerable
  def sum(&f)
    inject(0){|r, x| r + f.call(x)}
  end
  def minimum(&f)
    inf = 1.0/0
    inject(inf){|r, x| smaller r, f.call(x)}
  end
end

def distance(u, v)
  u.zip(v).sum{|x, y| (x - y)**2} ** 0.5
end

def random_point
    (1..$dim).map{rand}
end

def nearest
  u = random_point
  (2..$points).minimum{distance u, random_point}
end

$n.times{puts nearest}
