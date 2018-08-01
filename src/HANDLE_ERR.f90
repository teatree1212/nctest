!=====================================================================!
SUBROUTINE HANDLE_ERR (STATUS)
!---------------------------------------------------------------------!
INCLUDE 'netcdf.inc'
INTEGER :: status
CHARACTER (LEN = 80) :: err_message
!---------------------------------------------------------------------!
err_message = NF_STRERROR(status)
!WRITE (20, *) 'netCDF problem:',err_message
!WRITE (20, *) 'Stopping'
WRITE (* , *) 'netCDF problem:',err_message
WRITE (* , *) 'Stopping'
STOP
!---------------------------------------------------------------------!
END SUBROUTINE HANDLE_ERR
!=====================================================================!
