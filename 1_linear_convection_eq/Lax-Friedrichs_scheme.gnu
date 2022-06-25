set title "Advection solution on Riemann problem, Lax-Friedrich's scheme in time, central in space"
set border linewidth 2
set grid lw 1
plot [-2:4][0.2:1.4]'./Lax-Friedrichs_scheme_6000_01.dat' u 1:4 w l lw 2 t 'Initial Condition',\
                './Lax-Friedrichs_scheme_6000_01.dat' u 1:3 w l lw 2 t 'Exact',\
                './Lax-Friedrichs_scheme_60_9.dat' u 1:2 w l dt 2 lw 2 t 'nodes 60, CFL 0.9',\
                './Lax-Friedrichs_scheme_600_3.dat' u 1:2 w l dt 2 lw 2 t 'nodes 600, CFL 0.3',\
                './Lax-Friedrichs_scheme_6000_01.dat' u 1:2 w l dt 2 lw 2 t 'nodes 6000, CFL 0.01'
pause -1
