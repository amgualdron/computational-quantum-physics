module constants
    implicit none
    !set up the working precission
    integer, parameter :: dp = SELECTED_REAL_KIND(15)

    !useful constants
    real(kind = dp), parameter :: pi = acos(-1.0_dp)
    real(kind = dp), parameter :: C = 299792458.0_dp! speed of light m/s
    real(kind = dp), parameter :: h_planck = 4.135667696E-15_dp !plancks constant eV*s
    real(kind = dp), parameter :: hbar = h_planck / (2.0_dp * pi)
    real(kind = dp), parameter :: e_mass = 5.68562966E3_dp ! electron mass eV*s^2 / mm^2
    real(kind = dp), parameter :: e_charge = 1.602176634E-19_dp! electron charge coulombs
    real(kind = dp), parameter :: hbar2_2m = (hbar**2)/(2.0_dp*e_mass) ! eV/nm^2
    
end module
