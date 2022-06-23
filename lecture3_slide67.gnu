set border linewidth 2
set grid
plot [][0.2:1.4]'./slide67.dat' u 1:3 w lp lw 4 t 'NON-CONSERVATIVE',\
                './slide67.dat' u 1:4 w l lw 4 t 'EXACT',\
                './slide67.dat' u 1:2 w l lw 4 t 'CONSERVATIVE'
pause -1
