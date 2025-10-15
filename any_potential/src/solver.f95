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
        real(kind=dp), intent(in) :: x_min, x_max

        interface
            pure function v(x) result(v_x)
                use constants
                real(kind=dp), intent(in) :: x
                real(kind=dp) :: v_x
            end function v
        end interface 

        real(kind = dp), intent(out) :: E(N) !return array of N energies (eigenvalues)
        real(kind = dp), intent(out) :: psi(N,N) !return N eigenfunctions with N values each

        real(kind = dp), allocatable :: H(:,:)
        allocate(H(N,N))

    end subroutine solve_tise


end module solver