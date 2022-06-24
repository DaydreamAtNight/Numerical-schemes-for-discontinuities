set title "Advection solution on Riemann problem, Euler, first order upwind scheme"
set border linewidth 2
set grid lw 1
plot [][0.2:1.4]'./first_order_upwind_6000_01.dat' u 1:4 w l lw 2 t 'Initial Condition',\
                './first_order_upwind_6000_01.dat' u 1:3 w l lw 2 t 'Exact',\
                './first_order_upwind_60_9.dat' u 1:2 w l dt 2 lw 2 t 'nodes 60, CFL 0.9',\
                './first_order_upwind_600_3.dat' u 1:2 w l dt 2 lw 2 t 'nodes 600, CFL 0.3',\
                './first_order_upwind_6000_01.dat' u 1:2 w l dt 2 lw 2 t 'nodes 6000, CFD 0.01'
pause -1