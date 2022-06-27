program test

implicit none

integer, parameter :: nx = 120
real(4), dimension(nx) :: ux,gx,ux2,fx,x,ux1
integer :: i,it
real(4) :: itest,xlx,dx,dt,t,a,c,pi,a1,a2,xx,x1,x2,x3,x4

pi=acos(-1.)

itest=1 ! iteration end time
xlx=8 ! length of x direction
dx=xlx/nx
a=1. ! wave speed
c=0.7 ! courant number
dt=dx*c/a

do i=1,nx
    x(i)=(i-1)*xlx/nx-xlx/2.
    if (x(i)<0.) ux(i)=-1
    if (x(i)>=0.) ux(i)=1.
    ! if (x(i)==0.) ux(i)=0.
enddo
ux2(:)=ux(:)
gx(:)=ux(:)

do it=1,int(itest/dt)
t=(it-1)*dt
print *,'iteration number',it,t

do i=2,nx-1
    if (ux(i)<0.)   fx(i)=((ux(i+1))**2-(ux(i))**2)/dx !for CONSER
    if (ux(i)>0.)   fx(i)=((ux(i))**2-(ux(i-1))**2)/dx !for CONSER
enddo
fx(1)=fx(2)
fx(nx)=fx(nx-1)

do i=1,nx
!print *,'FLUX',fx(i)
ux(i)=gx(i)-dt/2.*fx(i)!CONSER
enddo
gx(:)=ux(:)

enddo

t=1.5 !for burger equation speed is (1.2+0.4)/2
ux1(:)=0.
do i=1,nx
x(i)=(i-1)*xlx/nx-xlx/2.
if (x(i)<-t) ux1(i)=-1.
if (x(i)>t) ux1(i)=1.
if ((x(i)>-t).and.(x(i)<t)) ux1(i)=x(i)/1.5
enddo

open(10,file='reverse_burger_first_order_upwind_1.dat', form='formatted')
do i=1,nx
write(10,*) x(i),ux(i),ux1(i), ux2(i)
!!write(10,*) x(i)+t,ux(i),ux1(i), ux2(i)
enddo
close(10)


call system('gnuplot reverse_burger_first_order_upwind.gnu')
end program test