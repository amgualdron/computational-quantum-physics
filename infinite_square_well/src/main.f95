program main
    use constants
    use calculations

    implicit none
    integer, parameter :: n_max = 6
    real(kind=dp), allocatable :: x(:), energy_levels(:), wavefunction(:,:), p(:,:)
    integer :: i, j, nx
    real(kind=dp) :: x1, x2, dx

    x1 = 0.0_dp
    x2 = 1.0_dp
    nx = 1000
    dx = (x2 - x1) / (nx - 1)

    x = [(x1 + (i-1)*dx, i = 1, nx)]

    allocate(energy_levels(n_max))
    allocate(wavefunction(n_max,nx))
    allocate(p(n_max,nx))

    call compute_energy_levels(n_max,x1,x2,energy_levels)
    call compute_psi_n(n_max,x,x1,x2,wavefunction)
    p = abs(wavefunction)**2

    open(UNIT=10, FILE='results/raw/probability.txt', STATUS='REPLACE')
    do i = 1, n_max
            write(10,*) p(i,:)
    end do
    write(10,*) x(:)
    close(10)

end program main
