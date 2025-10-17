module solver
    use constants
    implicit none 

    contains
    subroutine solve_tise (N, x_min, x_max, V, E, psi)
        !*****************************************************************************
        ! Subroutine that solves the tise in 1D for a given potential in [x min, x max]
        ! args: 
        !   N: number of points (higher N more accurate)  
        !   x_min: lower limit
        !   x_max: upper limit
        !   V: potential function
        !   E: energy eigen values (E_n)
        !   psi: wave function (eigenvector)
        !*****************************************************************************

        integer, intent(in) :: N
        real(kind = dp), intent(in) :: x_min, x_max
        real(kind = dp) :: dx
        interface
            pure function v(x) result(v_x)
                use constants
                real(kind = dp), intent(in) :: x
                real(kind = dp) :: v_x
            end function v
        end interface 

        real(kind = dp), intent(out) :: E(N) !return array of N energies (eigenvalues)
        real(kind = dp), intent(out) :: psi(N,N) !return N eigenfunctions with N values each
        ! LAPACK variables
        integer :: info, lwork
        real(kind = dp), allocatable :: work(:)

        ! Other variables
        integer :: i, j, n_eigen
        real(kind = dp) :: kin_const

  
        real(kind = dp), allocatable :: H(:,:)
        real(kind = dp), allocatable :: X(:)
        allocate(x(N))
        allocate(H(N,N))

        dx = (x_max - x_min)/N


        do i = 1, N 
            x(i) = x_min + (i-1)*dx
        end do

        do i = 1, N 
            H(i,i) = 2*hbar2_2m/(dx**2) + v(x(i))
            if(i>1) then
                H(i,i-1) = - hbar2_2m
            end if

        end do




    end subroutine solve_tise


end module solver