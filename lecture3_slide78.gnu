set border linewidth 2
set grid
set key top left
plot [][-1.2:1.2]'./slide78A.dat' u 1:2 w lp lw 4 t 'INITIAL',\
                './slide78.dat' u 1:2 w l lw 4 t 'UPWIND',\
                './slide78.dat' u 1:3 w l lw 4 t 'EXACT'
pause -1
