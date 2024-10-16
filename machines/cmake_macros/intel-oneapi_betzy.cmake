set(PIO_FILESYSTEM_HINTS "lustre")
string(APPEND CFLAGS " -qopt-report -march=core-avx2")
string(APPEND FFLAGS " -qopt-report -march=core-avx2")
set(NETCDF_C_PATH	$ENV{EBROOTNETCDF})
set(NETCDF_FORTRAN_PATH $ENV{EBROOTNETCDFMINFORTRAN})
set(PNETCDF_PATH	$ENV{PNETCDF})

if(DEFINED ENV{PIO})
  set(PIO_LIBDIR "$ENV{PIO}/lib")
  set(PIO_INCDIR "$ENV{PIO}/include")
endif()

string(REPLACE "-mkl=cluster" "" SLIBS "${SLIBS}")
string(APPEND CPPDEFS " -DHAVE_GETTID")

if (COMP_WAV STREQUAL ww3)
  if (MPILIB STREQUAL openmpi)
     string(APPEND SLIBS "  -l:libparmetis.a -lmetis ")
  endif()
endif() 

if (MPILIB STREQUAL impi)
 set(MPICC "mpiicc")
 set(MPICXX "mpiicpc")
 set(MPIFC "mpiifort")
endif()

if (MPILIB STREQUAL openmpi)
 set(MPICC "mpicc")
 set(MPICXX "mpicpc")
 set(MPIFC "mpifort")
endif()
