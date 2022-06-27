program test

implicit none

integer, parameter :: nx = 600
real(4), dimension(nx) :: ux,gx,fx,x,ux1,ux2,hx,fx1
real(4), dimension(nx) :: uxN,gxN,fxN
integer :: i,it
real(4) :: ul,ur,itest,xlx,dx,dt,t,a,c,pi,a1,a2,xx,x1,x2,x3,x4

pi=acos(-1.)

itest=2.5 ! iteration end time
xlx=8 ! lngth of x direction
dx=xlx/nx
a=1. ! wave speed
c=0.3 ! courant number
dt=dx*c/a

ul=1.2
ur=0.4
do i=1,nx
   x(i)=(i-1)*xlx/nx-xlx/2.  ! meshing
   if (x(i)<0.) ux(i)=ul   ! initial conditions
   if (x(i)>=0.) ux(i)=ur
   !if (x(i)==0.) ux(i)=0.
enddo

ux1(:)=ux(:) ! initial condition
uxN(:)=ux(:)
gx(:)=ux(:)
gxN(:)=ux(:)
print *, dt,itest
print *, ((itest/dt))
do it=1,int(itest/dt)
   t=(it-1)*dt
   ! print *,'iteration number',it,t,dt

   do i=2,nx
      fxN(i)=(uxN(i)-uxN(i-1))/dx !for NON-CONSERV
      fx(i)=((ux(i))**2-(ux(i-1))**2)/dx !for CONSERV
   enddo
   fx(1)=fx(2)
   fxN(1)=fxN(2)

   do i=1,nx
      uxN(i)=gxN(i)-dt*gxN(i)*fxN(i) !NON-CONSERV
      ux(i)=gx(i)-dt/2.*fx(i)!CONSERV
   enddo
   gx(:)=ux(:)
   gxN(:)=uxN(:)

enddo

t=(ul+ur)/2*t !for burger equation speed is (1.2+0.4)/2
do i=1,nx
   x(i)=(i-1)*xlx/nx-xlx/2.-t
   if (x(i)<0.) ux2(i)=ul
   if (x(i)>=0.) ux2(i)=ur
   !if (x(i)==0.) ux2(i)=0.
enddo

open(10,file='burger_first_order_upwind_600_3.dat', form='formatted')
do i=1,nx
   write(10,*) x(i)+t,ux(i),uxN(i),ux2(i), ux1(i)
enddo
close(10)


call system('gnuplot burger_first_order_upwind.gnu')
end program test