program test

implicit none

integer, parameter :: nx = 120
real(4), dimension(nx) :: ux,gx,ux2,fx,x,ux1
integer :: i,it,itest
real(4) :: xlx,dx,dt,t,a,c,pi,a1,a2,xx,x1,x2,x3,x4

pi=acos(-1.)

!set border linewidth 2
!set grid
!plot [][0.2:1.4]'./slide19.dat' u 1:2 w lp lw 4 t '','./slide19.dat' u 1:3 w lp lw 4 t '','./slide19.dat' u 1:4 w lp lw 4 t ''
xlx=8.
dx=xlx/nx
a=1. !wave speed
c=0.75 !courant number
dt=dx*c/a

do i=1,nx
x(i)=(i-1)*xlx/nx-xlx/2.
if (x(i)<0.) ux(i)=-1
if (x(i)>=0.) ux(i)=1.
if (x(i)==0.) ux(i)=0.
enddo

ux2(:)=ux(:)
open(10,file='slide78A.dat', form='formatted')
do i=1,nx
write(10,*) x(i),ux2(i)
enddo
close(10)
gx(:)=ux(:)

do it=1,int(1.5/dt)
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

open(10,file='slide78.dat', form='formatted')
do i=1,nx
write(10,*) x(i),ux(i),ux1(i)
!!write(10,*) x(i)+t,ux(i),ux1(i)
enddo
close(10)


call system('gnuplot lecture3_slide78.gnu')
end program test