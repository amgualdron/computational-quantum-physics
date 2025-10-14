module calculations
    use constants
    implicit none
    contains

    elemental function psi(x,x1,x2,n) result(w)
        !solves psi for a particle in a 1D infinite well from x1 to x2
        integer, intent(in) :: n
        real(kind = dp), intent(in) :: x,x1,x2 !quantum number, position, width of well
        real(kind = dp) :: w, l
        if( x <= x1 .or. x >= x2) then
            w = 0
            return
        end if
        
        l = x2 - x1

        w = sqrt(2.0_dp/l) * sin(n*pi*(x - x1)/l)

    end function psi

    subroutine compute_psi_n(n_final, x, x1,x2, wavefunction)
        implicit none
        integer, intent(in) :: n_final
        real(kind=dp), intent(in) :: x(:), x1,x2
        real(kind=dp), intent(out) :: wavefunction(:,:)
        integer :: i

        do i = 1, n_final
            wavefunction(i,:) = psi(x,x1,x2,i)
        end do
    end subroutine compute_psi_n

    elemental function energy(x1,x2,n)

        integer, intent(in) :: n
        real(kind = dp), intent(in) :: x1,x2
        real(kind = dp) :: energy, l

        l = x2 - x1

        energy = (hbar**2 * pi**2 * n**2)/(2*e_mass* l**2)

    end function energy

    subroutine compute_energy_levels(n_final, x1,x2,energies)
        implicit none
        integer, intent(in) :: n_final
        real(kind=dp), intent(in) :: x1,x2
        real(kind=dp), intent(out) :: energies(:)
        integer :: i

        do i = 1, n_final
            energies(i) = energy(x1,x2,i)
        end do
    end subroutine compute_energy_levels

end module