set title "Burger soluion on Riemann problem, Euler in time, first order upwind difference in space"
set border linewidth 2
set grid lw 1
plot [-2:4][0.2:1.4]'./burger_first_order_upwind_600_3.dat' u 1:5 w l lw 2 t 'Initial Condition',\
                './burger_first_order_upwind_600_3.dat' u 1:4 w l lw 2 t 'Exact',\
                './burger_first_order_upwind_60_9.dat' u 1:3 w l dt 2  lw 2 t 'Non-conserv, nodes 60, CFL 0.9',\
                './burger_first_order_upwind_60_9.dat' u 1:2 w l dt 2  lw 2 t 'Conserv, nodes 60, CFL 0.9',\
                './burger_first_order_upwind_600_3.dat' u 1:3 w l dt 2  lw 2 t 'Non-conserv, nodes 600, CFL 0.3',\
                './burger_first_order_upwind_600_3.dat' u 1:2 w l dt 2  lw 2 t 'Conserv, nodes 600, CFL 0.3'
pause -1
