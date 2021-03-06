MODULE PROCESS_Mod

!!$***********************************************************************
!!$   Time-stamp: <2006-12-20 16:51:21 marchi>                           *
!!$                                                                      *
!!$                                                                      *
!!$                                                                      *
!!$======================================================================*
!!$                                                                      *
!!$              Author:  Massimo Marchi                                 *
!!$              CEA/Centre d'Etudes Saclay, FRANCE                      *
!!$                                                                      *
!!$              - Tue Nov 21 2006 -                                     *
!!$                                                                      *
!!$***********************************************************************

!!$---- This module is part of the program  ----*

  USE PARAMETERS_Mod, ONLY: Parameters__Scan=>Scan
  USE SETUP_Mod, ONLY: Setup__Scan=>Scan
  USE ERROR_Mod, ONLY: Print_Errors, Add_Errors=>Add,Setup_Errors
  USE MYPARSE_Mod, ONLY: max_pars
  USE CLASS_Tree, ONLY: Get_Tree, Branch, Tree
  IMPLICIT none
  PRIVATE
  PUBLIC Inputs,Grammar, Construe
  TYPE(tree), POINTER, SAVE :: Inputs,Grammar
  CHARACTER(len=max_pars), DIMENSION(:), ALLOCATABLE, PRIVATE :: strngs
CONTAINS
  SUBROUTINE Construe
    TYPE(Branch), POINTER :: checks,heldo
    INTEGER :: o
    CALL Setup_Errors
    CALL Get_Tree(Inputs)
    CALL Setup__Scan
    CALL Parameters__Scan
    CALL Print_Errors()
  END SUBROUTINE Construe
END MODULE PROCESS_Mod
