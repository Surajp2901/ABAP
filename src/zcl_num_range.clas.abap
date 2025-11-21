CLASS zcl_num_range DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_NUM_RANGE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lv_object   TYPE cl_numberrange_objects=>nr_attributes-object,
          lt_interval TYPE cl_numberrange_intervals=>nr_interval,
          ls_interval TYPE cl_numberrange_intervals=>nr_nriv_line.

    lv_object = 'ZNUM_RANGE'.

*   intervals
    ls_interval-nrrangenr  = '01'.
    ls_interval-fromnumber = '1000000001'.
    ls_interval-tonumber   = '1010000001'.
    ls_interval-procind    = 'I'.
    APPEND ls_interval TO lt_interval.

*   create intervals

    TRY.
        CALL METHOD cl_numberrange_intervals=>create
          EXPORTING
            interval  = lt_interval
            object    = lv_object
            subobject = ' '
          IMPORTING
            error     = DATA(lv_error)
            error_inf = DATA(ls_error)
            error_iv  = DATA(lt_error_iv)
            warning   = DATA(lv_warning).

      CATCH cx_number_ranges INTO DATA(lx_n_r).

    ENDTRY.

    TRY.
        CALL METHOD cl_numberrange_runtime=>number_get
          EXPORTING
            nr_range_nr = '01'
            object      = lv_object
          IMPORTING
            number      = DATA(lv_number)
            returncode  = DATA(lv_rcode).


      CATCH cx_number_ranges.

    ENDTRY.

    out->write( 'Successful' ).

  ENDMETHOD.
ENDCLASS.
