set title "Advection solution on Riemann problem, Euler in time, Lax-Wendroff with coefficient \phi in space"
set border linewidth 2
set grid lw 1
plot [-2:4][0.2:1.4]'./Lax-Wendroff_6000_3_10.dat' u 1:4 w l lw 3 t 'Initial Condition',\
                './Lax-Wendroff_6000_3_10.dat' u 1:3 w l lw 3 t 'Exact',\
                './Lax-Wendroff_600_3_1.dat' u 1:2 w l dt 2 lw 2 t 'node 600, phi 1',\
                './Lax-Wendroff_600_3_12.dat' u 1:2 w l dt 2 lw 2 t 'node 600, phi 1.2',\
                './Lax-Wendroff_600_3_2.dat' u 1:2 w l dt 2 lw 2 t 'node 600, phi 2.0',\
                './Lax-Wendroff_600_3_10.dat' u 1:2 w l dt 2 lw 2 t 'node 600, phi 10',\
                './Lax-Wendroff_6000_3_10.dat' u 1:2 w l dt 2 lw 2 t 'node 6000, phi 10'                                 
pause -1
