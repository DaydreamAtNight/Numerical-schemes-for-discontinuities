set title "Advection solution on Riemann problem, Euler in time, central difference in space"
set border linewidth 2
set grid lw 1
plot [][0.2:1.4]'./base_60_9.dat' u 1:4 w l lw 2 t 'Initial Condition',\
                './base_60_9.dat' u 1:3 w l lw 2 t 'Exact',\
                './base_60_9.dat' u 1:2 w l dt 2 lw 2 t 'node = 60, CFL = 0.9',\
                './base_600_3.dat' u 1:2 w l dt 2 lw 2 t 'node = 600, CFL = 0.3'
pause -1
