#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: �Ȥ⤨��
(��)
  #{name} 10  �� 10 ����
(���ץ������)
  -p=60,40,70 �ޤ��� -prob=60,40,70
    �� A �� B �˳�Ψ 60% �Ǿ���, B �� C �˳�Ψ 40% �Ǿ���,
       C �� A �˳�Ψ 70% �Ǿ���
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

$prob ||= $p || '50,50,50'
$prob = $prob.split(/,/).map{|s| s.to_f / 100}

$n = ARGV.shift.to_i

#####################################

ab, bc, ca = $prob
$p_table = {
  :A => {:B => ab, :C => 1 - ca},
  :B => {:C => bc, :A => 1 - ab},
  :C => {:A => ca, :B => 1 - bc},
}

def fight(x, y)
  rand < $p_table[x][y] ? [x, y] : [y, x]
end

def trial
  history = []
  x, y, z = [:A, :B, :C]
  begin
    winner, loser = fight x, y
    history.unshift winner
    x, y, z = [winner, z, loser]
  end until history[0] == history[1]
  history[0]
end

$n.times{puts trial}
