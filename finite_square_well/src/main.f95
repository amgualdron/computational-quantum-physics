program main
    use constants
    use calculations
    implicit none
    integer, parameter :: n_max = 5
    real(kind=dp), allocatable :: x(:), energy_levels(:), wavefunction(:,:), p(:,:)
    integer :: i, nx
    real(kind=dp) :: x1, x2, dx

    x1 = 0.0_dp
    x2 = 1.0_dp
    nx = 1000
    dx = (x2 - x1) / (nx - 1)

    x = [(x1 + (i-1)*dx, i = 1, nx)]




end program main
