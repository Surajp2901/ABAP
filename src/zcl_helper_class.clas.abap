CLASS zcl_helper_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HELPER_CLASS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_customer_id TYPE zcustomer_head,
          lt_customer_id TYPE STANDARD TABLE OF zcustomer_head.


    ls_customer_id-customerid = '0100000001'.
    ls_customer_id-customername = 'Becker Berlin'.

    APPEND  ls_customer_id TO lt_customer_id.

    ls_customer_id-customerid = '0100000002'.
    ls_customer_id-customername = 'DelBont Industries'.

    APPEND  ls_customer_id TO lt_customer_id.

    ls_customer_id-customerid = '0100000003'.
    ls_customer_id-customername = 'Talpa'.

    APPEND  ls_customer_id TO lt_customer_id.

    ls_customer_id-customerid = '0100000004'.
    ls_customer_id-customername = 'Panorama Studios'.

    APPEND  ls_customer_id TO lt_customer_id.

    ls_customer_id-customerid = '0100000005'.
    ls_customer_id-customername = 'TECUM'.

    APPEND  ls_customer_id TO lt_customer_id.

    MODIFY zcustomer_head FROM TABLE @lt_customer_id.

    out->write( 'Successful' ).

  ENDMETHOD.
ENDCLASS.
