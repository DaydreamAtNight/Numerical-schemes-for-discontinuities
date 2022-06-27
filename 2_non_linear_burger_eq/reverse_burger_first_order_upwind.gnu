set title "Burger solution on Riemann problem at different initial conditions"
set border linewidth 2
set grid linewidth 1.5
set key top left
plot [][-1.2:1.2]'./reverse_burger_first_order_upwind_1.dat' u 1:4 w l lw 3 t 'INITIAL',\
                './reverse_burger_first_order_upwind_1.dat' u 1:3 w l lw 3 t 'EXACT',\
                './reverse_burger_first_order_upwind_1.dat' u 1:2 w l dt 2 lw 2 t 'UPWIND initial 1',\
                './reverse_burger_first_order_upwind_2.dat' u 1:2 w l dt 2 lw 2 t 'UPWIND initial 2'
pause -1
