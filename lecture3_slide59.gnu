set title "Advection solution on Riemann problem"
set border linewidth 2
set grid lw 1
plot [][0.2:1.4]'./slide59.dat' u 1:4 w l lw 2 t 'Initial Condition',\
                './slide59.dat' u 1:3 w l lw 2 t 'Exact',\
                './slide59.dat' u 1:2 w l dt 2 lw 2 t 'Numerical Result'
pause -1