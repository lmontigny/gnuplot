#! /bin/sh

name=myPlot.eps
gnuplot << EOF


set term postscript eps enhanced color dashed font "Helvetica" 14 linewidth 2
#set term png
#set size 1.0,0.5
set output "$name"
set xlabel "x_label"
set ylabel "y_label"
set key left

set xrange [0:0.1]
set title "title" 
set key bottom 
set autoscale y 

plot 'data.txt' u 1:2 w l smooth bezier lw 2 title 'N9000', \
     'data.txt' u 1:3 w l smooth bezier lw 2 title 'N3000'

set output

EOF

ps2pdf -dEPSCrop $name
convert -density 1200x1200 -quality 100 torque.eps torque.jpg

