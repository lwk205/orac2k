!!$/---------------------------------------------------------------------\
!!$   Copyright  � 2006-2007 Massimo Marchi <Massimo.Marchi at cea.fr>   |
!!$                                                                      |
!!$    This software is a computer program named oracDD whose            |
!!$    purpose is to simulate and model complex molecular systems.       |
!!$    The code is written in fortran 95 compliant with Technical        |
!!$    Report TR 15581, and uses MPI-1 routines for parallel             |
!!$    coding.                                                           |
!!$                                                                      |
!!$    This software is governed by the CeCILL license under             |
!!$    French law and abiding by the rules of distribution of            |
!!$    free software.  You can  use, modify and/ or redistribute         |
!!$    the software under the terms of the CeCILL icense as              |
!!$    circulated by CEA, CNRS and INRIA at the following URL            |
!!$    "http://www.cecill.info".                                         |
!!$                                                                      |
!!$    As a counterpart to the access to the source code and rights      |
!!$    to copy, modify and redistribute granted by the license,          |
!!$    users are provided only with a limited warranty and the           |
!!$    software's author, the holder of the economic rights, and         |
!!$    the successive licensors have only limited liability.             |
!!$                                                                      |
!!$    The fact that you are presently reading this means that you       |
!!$    have had knowledge of the CeCILL license and that you accept      |
!!$    its terms.                                                        |
!!$                                                                      |
!!$    You should have received a copy of the CeCILL license along       |
!!$    with this program; if not, you can collect copies on the URL's    |
!!$    "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"       |
!!$    "http://www.cecill.info/licences/Licence_CeCILL_V2-fr.html"       |
!!$                                                                      |
!!$----------------------------------------------------------------------/
MODULE Numerics

!!$***********************************************************************
!!$   Time-stamp: <2007-01-04 16:53:01 marchi>                           *
!!$                                                                      *
!!$                                                                      *
!!$                                                                      *
!!$======================================================================*
!!$                                                                      *
!!$              Author:  Massimo Marchi                                 *
!!$              CEA/Centre d'Etudes Saclay, FRANCE                      *
!!$                                                                      *
!!$              - Wed Dec 20 2006 -                                     *
!!$                                                                      *
!!$***********************************************************************

!!$---- This subroutine is part of the program ORAC  ----*
  IMPLICIT none
  PRIVATE
  PUBLIC :: MatInv, Determinant
  REAL(8), SAVE :: Determinant
CONTAINS
  FUNCTION MatInv(A,B) RESULT(out)
    REAL(8) :: out

    REAL(8), DIMENSION(:,:) :: A
    REAL(8), DIMENSION(:,:) :: B

    INTEGER, DIMENSION(:), ALLOCATABLE :: l
    INTEGER, DIMENSION(:), ALLOCATABLE :: m
    INTEGER :: o,p
    REAL(8) :: d
    
    o=SIZE(A,1)
    p=SIZE(A,2)
    ALLOCATE(l(o),m(o))
    b=a
    IF(o < 20) THEN
       CALL DMINV(b,o,d,l,m)
    END IF
    IF(d == 0.0D0) b=0.0D0
    Determinant=d
    out=d
    DEALLOCATE(l,m)
  CONTAINS
    INCLUDE 'dminv.f'
  END FUNCTION MatInv
END MODULE Numerics
