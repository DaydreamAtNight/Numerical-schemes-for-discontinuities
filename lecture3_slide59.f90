program test

implicit none

integer, parameter :: nx =300
real(4), dimension(nx) :: ux,gx,fx,x,ux1,ux2,hx,fx1
real(4), dimension(nx) :: uxN,gxN,fxN
integer :: i,it,itest
real(4) :: xlx,dx,dt,t,a,c,pi,a1,a2,xx,x1,x2,x3,x4

pi=acos(-1.)

xlx=8.
dx=xlx/nx
a=1. !wave speed
c=0.3 !courant number
dt=dx*c/a

do i=1,nx
x(i)=(i-1)*xlx/nx-xlx/2.
if (x(i)<0.) ux(i)=1.2
if (x(i)>=0.) ux(i)=0.4
enddo
uxN=ux
gx(:)=ux(:)

do it=1,int(1/dt)
!do it=1,int(2/dt)
t=(it-1)*dt
print *,'iteration number',it,t,dt

do i=2,nx-1
  fx(i)=(ux(i+1)-ux(i-1))/(2.*dx) !CENTERED 
!   fx(i)=(ux(i)-ux(i-1))/dx !UPWIND (with EULER!)
enddo
fx(1)=fx(2)
fx(nx)=fx(nx-1)
do i=2,nx-1
ux(i)=gx(i)-dt*a*fx(i) !EULER
!ux(i)=0.5*(gx(i-1)+gx(i+1))-dt*a*fx(i) !LAX FRIED
enddo
ux(1)=ux(2)
ux(nx)=ux(nx-1)
gx(:)=ux(:)

enddo

t=0.8*t !for burger equation speed is (1.2+0.4)/2
do i=1,nx
x(i)=(i-1)*xlx/nx-xlx/2.-t
if (x(i)<0.) ux2(i)=1.2
if (x(i)>=0.) ux2(i)=0.4
!if (x(i)==0.) ux2(i)=0.
enddo

open(10,file='slide59.dat', form='formatted')
write(10,*) 'x ', 'ux ', 'ux2 ', 'uxN' 
do i=1,nx
write(10,*) x(i)+t,ux(i),ux2(i),uxN(i)
enddo
close(10)

call system('gnuplot lecture3_slide59.gnu')

end program test