program test

implicit none

integer, parameter :: nx =6000
real(4), dimension(nx) :: ux,gx,fx,x,ux1,ux2,hx,fx1
real(4), dimension(nx) :: uxN,gxN,fxN
integer :: i,it,itest
real(4) :: xlx,dx,dt,t,a,c,pi,a1,a2,xx,x1,x2,x3,x4

pi=acos(-1.)

xlx=8.
dx=xlx/nx
a=1. !wave speed
c=0.01 !courant number
dt=dx*c/a

do i=1,nx
x(i)=(i-1)*xlx/nx-xlx/2.
if (x(i)<0.) ux(i)=1.2
if (x(i)>=0.) ux(i)=0.4
enddo
uxN=ux
gx(:)=ux(:)

do it=1,int(2/dt)
t=(it-1)*dt
print *,'iteration number',it,t,dt

do i=2,nx-1
   fx(i)=(ux(i+1)-ux(i-1))/(2.*dx) !LAX-WEN Term 1
   hx(i)=10*(ux(i+1)-2*ux(i)+ux(i-1))/(dx*dx) !LAX-WEN Term 2  
enddo
fx(1)=fx(2)
fx(nx)=fx(nx-1)
hx(1)=hx(2)
hx(nx)=hx(nx-1)
do i=1,nx
ux(i)=gx(i)-a*dt*fx(i)+a*a*dt*dt/2.*hx(i)
enddo
gx=ux
enddo

t=0.8*t !for burger equation speed is (1.2+0.4)/2
do i=1,nx
x(i)=(i-1)*xlx/nx-xlx/2.-t
if (x(i)<0.) ux2(i)=1.2
if (x(i)>=0.) ux2(i)=0.4
!if (x(i)==0.) ux2(i)=0.
enddo

open(10,file='Lax-Wendroff_6000_3_10.dat', form='formatted')
do i=1,nx
write(10,*) x(i)+t,ux(i),ux2(i),uxN(i)
enddo
close(10)

call system('gnuplot Lax-Wendroff_coefficient.gnu')

end program test