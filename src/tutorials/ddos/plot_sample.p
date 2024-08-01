# This file will create a stacked plot for DOS
set terminal png size 1200,900 linewidth 3
set output 'DOSplot_sample.png'
set linestyle 1 linecolor rgb 'blue'
set linestyle 2 linecolor rgb 'red'
set multiplot layout 3,1
# first plot top
set bmargin at screen 0.65
set tmargin at screen 0.95
set xrange[-12:0]
set yrange[0:10]
set xtics format ' '
set ytics 0,2,8
plot 'tcne.dat' with lines linestyle 1 notitle,'fermi.dat' with lines linestyle 2 notitle
# Second plot middle
set bmargin at screen 0.35
set tmargin at screen 0.65
plot 'benzene.dat' with lines linestyle 1 notitle,'fermi.dat' with lines linestyle 2 notitle
# Third plot
set bmargin at screen 0.05
set tmargin at screen 0.35
set xtics format '%g'
plot 'all.dat' with lines linestyle 1 notitle,'fermi.dat' with lines linestyle 2 notitle
unset multiplot

