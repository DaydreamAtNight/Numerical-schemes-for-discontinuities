set border linewidth 2
set grid
plot [][0.2:1.4]'./slide64.dat' u 1:2 w lp lw 4 t '',\
                './slide64.dat' u 1:3 w l lw 4 t 'Exact',\
                './slide64.dat' u 1:4 w l lw 4 t 'Initial Condition'
pause -1
