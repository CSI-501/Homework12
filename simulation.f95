program simulation
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 12
    ! 04/26/2023
    ! This program performs an orbital simulation.
  
    ! Clear out the memory
    implicit none

    ! Declare our variables
    double precision :: Planet(4)
    double precision :: fP(4)
    real*8 :: G = 1
    real*8 :: M  = 1
    real*8 :: M2 = 1
    real*8 :: h, T, KE, PE, kinE, potE
    integer :: n, i, j
 
    ! Ask user for initial postions
    print*, 'Enter an initial x coordinate:'
    read(*,*) Planet(1)

    print*, 'Enter an initial y coordinate:'
    read(*,*) Planet(3)

    ! Ask user for initial velocities
    print*, 'Enter an initial x velocity:'
    read(*,*) Planet(2)

    print*, 'Enter an initial y velocity:'
    read(*,*) Planet(4)

    ! Ask user for time information
    print*, 'Enter a time increment amount:'
    read(*,*) h

    print*, 'Enter the total time:'
    read(*,*) T

    ! Open output file
    open(13, file='simulation.txt')

    ! Calculate how many iterations to perform
    n = int(T/ h)

    ! Calcute our initial energy amounts
    kinE = KE(M2, Planet(2), Planet(4))
    potE = PE(G, M, M2, Planet(1), Planet(3))

    ! Write our initial positions out
    write(13, *) 0, Planet(1), Planet(3), kinE, potE, (kinE + potE)

    ! Print our initial energies out
    print*, 'Initial Kinetic Energy:', kinE
    print*, 'Initial Potential Energy:', potE
    print*, 'Initial Energy:', (kinE + potE)

    ! Perform our simulation
    do i = 1, n

        ! Perform our forward Euler
        call fPrime(Planet, fP, G, M)
        do j = 1, 4
            Planet(j) = Planet(j) + h * fP(j)
        end do

        ! Calcute our energy amounts
        kinE = KE(M2, Planet(2), Planet(4))
        potE = PE(G, M, M2, Planet(1), Planet(3))

        ! Write our results out
        write(13, *) (float(i)*h), Planet(1), Planet(3), kinE, potE, (kinE + potE)
    end do

    ! Print our final energies out
    print*, 'Final Kinetic Energy:', kinE
    print*, 'Final Potential Energy:', potE
    print*, 'Final Energy:', (kinE + potE)

    ! Close our file writer
    close(13)
    
end program simulation

! Declare subroutine to calculate our fprime in forward euler
subroutine fPrime(Planet, fP, G, M)
    ! Clear the memory
    implicit none
    ! Declare subroutine specific variables
    real*8 :: Planet(4), fP(4), r, G, M
    ! Caculate our distance R
    r = sqrt(Planet(1)**2 + Planet(3)**2)
    ! Get our velocity for x
    fP(1) = Planet(2)
    ! Calculate our fprime for the x coordinate
    fP(2) = -G * M * Planet(1) / r**3
    ! Get our velocity for y
    fP(3) = Planet(4)
    ! Calculate our fprime for the y coordinate
    fP(4) = -G * M * Planet(3) / r**3
    end subroutine fPrime

function KE(M2, vx, vy) result (energy)
    ! Declare function to calculate the Kinetic Energy
    ! Clear the memory
    implicit none
    ! Declare the variables
    real*8 :: M2, vx, vy, energy
    ! Perform our caLculation
    energy = 0.5 * M2 * (vx**2 + vy**2)
end function KE

function PE(G, M, M2, x, y) result (energy)
    ! Declare function to caculate the Potential Energy
    ! Clear the memory
    implicit none
    ! Declare the variables
    real*8 :: G, M, M2, x, y, energy
    ! Perform our calculation
    energy = (-G * M * M2) / sqrt(x**2 + y**2)
end function PE