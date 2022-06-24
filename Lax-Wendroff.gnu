set title "Advection solution on Riemann problem, Euler in time, Lax-Wendroff in space"
set border linewidth 2
set grid lw 1
plot [][0.2:1.4]'./Lax-Wendroff_6000_01.dat' u 1:4 w l lw 4 t 'Initial Condition',\
                './Lax-Wendroff_6000_01.dat' u 1:3 w l lw 4 t 'Exact',\
                './Lax-Wendroff_60_9.dat' u 1:2 w l dt 2 lw 2 t 'node 60, CFL 0.9',\
                './Lax-Wendroff_600_3.dat' u 1:2 w l dt 2 lw 2 t 'node 600, CFL 0.3',\
                './Lax-Wendroff_6000_01.dat' u 1:2 w l dt 2 lw 2 t 'node 6000, CFL 0.01'                  
pause -1
