set title "Advection solution on Riemann problem, Lax-Friedrich in time, linear upwind in space"
set border linewidth 2
set grid lw 1
plot [-2:4][0.2:1.4]'./Lax-Friedrich_linear_upwind.dat' u 1:4 w l lw 2 t 'Initial Condition',\
                './Lax-Friedrich_linear_upwind.dat' u 1:3 w l lw 2 t 'Exact',\
                './Lax-Friedrich_linear_upwind.dat' u 1:2 w l dt 2 lw 2 t 'node = 60, CFL = 0.9'
pause -1
