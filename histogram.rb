#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

include Math

def usage
  name = File::basename $0
  print <<EOU
#{name}: �ҥ��ȥ�����ɽ��
(��)
  #{name} foo.dat
(���ץ������)
  -width=20  �ޤ��� -w=20  �� 20 ���
  -unit=10   �ޤ��� -u=10  �� * ��Ĥ� 10
  -form=%05g �ޤ��� -f=%05g �� ������ 00030 �Τ褦��ɽ��
  -help      �ޤ��� -h     �� ���Υ�å�������ɽ��
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

$width ||= $w || 10
$width = $width.to_f

$unit ||= $u || 1
$unit = $unit.to_f

$form ||= $f || '%5g'

$mark = '*'

$dat = ARGF.readlines.map{|x| x.chop.to_f}.sort

def f2i(x)
  (x / $width).floor
end

def i2f(i)
  i * $width
end

def line(i, h, n)
  min = sprintf($form, i2f(i))
  bar = $mark * (h / $unit)
  percent = sprintf "%.1f", h.to_f / n * 100
  "#{min}<= | #{bar} #{h} (#{percent}%)"
end

module Enumerable
  def sum
    inject(0){|x,y| x + y}
  end
  def mean
    sum / length.to_f
  end
  def stddev
    m = mean
    sqrt(map{|x| (x - m)**2}.mean)
  end
  def median
    n = length
    i = n / 2
    (n % 2 == 0) ? sort[i-1..i].mean : sort[i]
  end
end

$h = Hash::new 0
$dat.each{|x| $h[f2i(x)] += 1}
$min = f2i($dat[0])
$max = f2i($dat[-1])

n = $dat.length
($min..$max).to_a.reverse.each{|i| puts line(i, $h[i], n)}

m, mu, sigma = [$dat.median, $dat.mean, $dat.stddev].map{|x| sprintf '%g', x}
puts "total #{n} data (median #{m}, mean #{mu}, std dev #{sigma})"
