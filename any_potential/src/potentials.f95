module potentials 
    use constants
    implicit none

    contains 
    pure elemental real function v_infinite_square_well(x,l0,l1)
        !**********************************************************
        ! Infinite square well potential from [l0,l1] in 1 dimension
        ! args: 
        !   x: independent variable, position
        !   l0: lower limit of square well
        !   l1: upper limit of square well
        !**********************************************************

        real(kind = dp), intent(in) :: x,l0,l1

        if(x >= l0 .and. x <- l1) then 
            v_infinite_square_well = 0;
            return
        else 
            v_infinite_square_well = huge(1.0)
        end if 

    end function v_infinite_square_well

    pure elemental real(kind = dp) function v_finite_square_well(x,l0,l1, V0) result(v)
        !**********************************************************
        ! finite square well potential from [l0,l1] in 1 dimension
        ! args: 
        !   x: independent variable, position
        !   l0: lower limit of square well
        !   l1: upper limit of square well
        !   V0: potential outside the well
        !**********************************************************

        real(kind = dp), intent(in) :: x,l0,l1, V0

        if(x >= l0 .and. x <- l1) then 
            v = 0
            return
        else 
            v = V0
        end if 

    end function v_finite_square_well

    ! pure elemental real function v_parabollic (x)

    ! end function v_parabollic

    pure elemental real(kind = dp) function V_kronig_penney(x, a, b, V0) result(v)
        !**************************************************************
        ! The kronig-penney potetial is a series of finite wells and barriers in 1 dimension
        ! args: 
        !   x: position
        !   a: width of well
        !   b: with of barrier
        !   V0: height of barrier 
        !**************************************************************

        real(kind = dp), intent(in) :: x , a , b , V0
        real(kind = dp) :: d !position of x within a given period (a+b)

        d = mod(x,a+b)
        if(d < a) then
            v = 0
        else 
            v = V0
        end if
          
    end function V_kronig_penney

end module potentials