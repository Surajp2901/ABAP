
CLASS lhc_item DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR item RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR item RESULT result.

    METHODS refreshitem FOR MODIFY
      IMPORTING keys FOR ACTION item~refreshitem RESULT result.

    METHODS validate_amount FOR VALIDATE ON SAVE
      IMPORTING keys FOR item~validate_amount.

    METHODS validate_quantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR item~validate_quantity.

    METHODS determine_amount FOR DETERMINE ON MODIFY
      IMPORTING keys FOR item~determine_amount.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR item RESULT result.


ENDCLASS.

CLASS lhc_item IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zr_order_head IN LOCAL MODE
    ENTITY head
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_head).

    IF lt_head[ 1 ]-Billingstatus IS NOT INITIAL
    OR lt_head[ 1 ]-Deliverystatus IS NOT INITIAL.

      LOOP AT keys INTO DATA(ls_keys).
        APPEND VALUE     #(
                            %tky = keys[ sy-tabix ]-%tky
                            %update = if_abap_behv=>fc-o-disabled
                            %delete =  if_abap_behv=>fc-o-disabled
                          ) TO result .
      ENDLOOP.
    ELSE.
      LOOP AT keys INTO ls_keys.
        APPEND VALUE     #(
                            %tky = keys[ sy-tabix ]-%tky
                            %update = if_abap_behv=>fc-o-enabled
                            %delete =  if_abap_behv=>fc-o-enabled
                          ) TO result .
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD refreshitem.

    DATA:
      lt_business_data  TYPE TABLE OF zservice_consumption=>tys_sales_order_line_item,
      lo_request_item   TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response_item  TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_filter_factory TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1  TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_soid     TYPE RANGE OF vbeln,
      ls_range_soid     LIKE LINE OF lt_range_soid,
      lt_update_items   TYPE TABLE FOR UPDATE zr_order_item,
      lt_create_items   TYPE TABLE FOR CREATE zr_order_head\_item,
      lo_http_client    TYPE REF TO if_web_http_client,
      lo_client_proxy   TYPE REF TO /iwbep/if_cp_client_proxy,
      lv_salesorderid   TYPE vbeln,
      lt_item           TYPE TABLE FOR READ RESULT zr_order_head\_item,
      lt_reported       TYPE TABLE FOR REPORTED zr_order_item.

    TRY.

        " Your existing S/4HANA connection code...
        DATA(lo_destination) = cl_http_destination_provider=>create_by_url(
          'https://sapes5.sapdevcenter.com'
        ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        lo_http_client->get_http_request( )->set_authorization_basic(
          i_username = 'S0025726574'
          i_password = 'Sap@7161'
        ).

        lo_http_client->get_http_request( )->set_header_field(
          i_name  = 'sap-client'
          i_value = '002'
        ).

        lo_http_client->get_http_request( )->set_header_field(
          i_name  = 'Accept'
          i_value = 'application/json'
        ).

        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSERVICE_CONSUMPTION'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/iwbep/GWSAMPLE_BASIC/' ).

        ASSERT lo_http_client IS BOUND.

        lv_salesorderid = keys[ 1 ]-Salesorderid.

        ls_range_soid-sign = 'I'.
        ls_range_soid-option = 'EQ'.
        ls_range_soid-low = lv_salesorderid.

        INSERT ls_range_soid INTO TABLE lt_range_soid.
        " Navigate to the resource and create a request for the read operation
        lo_request_item = lo_client_proxy->create_resource_for_entity_set( 'SALES_ORDER_LINE_ITEM_SET' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request_item->create_filter_factory( ).
        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SALES_ORDER_ID'
                                                               it_range             = lt_range_soid ).

        lo_request_item->set_filter( lo_filter_node_1 ).
        lo_request_item->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response_item = lo_request_item->execute( ).
        lo_response_item->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ ENTITIES OF zr_order_head IN LOCAL MODE
        ENTITY head BY \_item
        ALL FIELDS
        WITH VALUE #( (  %key-Salesorderid = lv_salesorderid ) )
        RESULT lt_item.

        DATA(lv_cid) = 0.
        LOOP AT lt_business_data INTO DATA(ls_business_item).
          lv_cid = lv_cid + 1.
          READ TABLE lt_item WITH KEY itemposition = ls_business_item-item_position TRANSPORTING NO FIELDS.
          IF sy-subrc = 0.
            APPEND VALUE #(
              %is_draft    = keys[ 1 ]-%is_draft
              salesorderid = ls_business_item-sales_order_id
                  itemposition = ls_business_item-item_position
                  productid    = ls_business_item-product_id
                  note         = ls_business_item-note
                  notelanguage = ls_business_item-note_language
                  currencycode = ls_business_item-currency_code
                  grossamount  = ls_business_item-gross_amount
                  netamount    = ls_business_item-net_amount
                  taxamount    = ls_business_item-tax_amount
                  deliverydate = ls_business_item-delivery_date
                  quantity     = ls_business_item-quantity
                  quantityunit = ls_business_item-quantity_unit )
           TO lt_update_items.

            MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
            ENTITY item
            UPDATE
            FIELDS ( itemposition productid note notelanguage currencycode grossamount
            netamount taxamount deliverydate quantity quantityunit )
            WITH lt_update_items
            MAPPED DATA(ls_upd_mapped_item)
            FAILED DATA(ls_upd_failed_item)
            REPORTED DATA(ls_upd_reported_item).

          ELSE.

            APPEND VALUE #(
            %is_draft    = keys[ 1 ]-%is_draft
            salesorderid = ls_business_item-sales_order_id
             %target = VALUE #(
                (
                %cid = lv_cid
                itemposition = ls_business_item-item_position
                salesorderid = ls_business_item-sales_order_id
                productid    = ls_business_item-product_id
                note         = ls_business_item-note
                notelanguage = ls_business_item-note_language
                currencycode = ls_business_item-currency_code
                grossamount  = ls_business_item-gross_amount
                netamount    = ls_business_item-net_amount
                taxamount    = ls_business_item-tax_amount
                deliverydate = ls_business_item-delivery_date
                quantity     = ls_business_item-quantity
                quantityunit = ls_business_item-quantity_unit )
                )
                ) TO lt_create_items.

            MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
            ENTITY head
            CREATE BY \_item
            FIELDS ( itemposition productid note notelanguage currencycode grossamount
            netamount taxamount deliverydate quantity quantityunit )
            WITH lt_create_items
            MAPPED DATA(ls_crt_mapped_item)
            FAILED DATA(ls_crt_failed_item)
            REPORTED DATA(ls_crt_reported_item).

          ENDIF.
        ENDLOOP.

      CATCH cx_http_dest_provider_error INTO DATA(lx_CX_HTTP_DEST_PROVIDER_ERROR).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote_item).

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway_item).

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error_item).

        RAISE SHORTDUMP lx_web_http_client_error_item.

    ENDTRY.

    IF ls_upd_failed_item IS INITIAL.

      CLEAR lt_item.
      READ ENTITIES OF zr_order_head IN LOCAL MODE
          ENTITY head BY \_item
          ALL FIELDS
          WITH VALUE #( (  %key-Salesorderid = lv_salesorderid ) )
          RESULT lt_item.

      result = VALUE #( FOR ls_item IN lt_item
                  ( %tky-%is_draft = ls_item-%is_draft
                    %tky-Salesorderid = lv_salesorderid
                    %tky-Itemposition = ls_item-Itemposition
*                    %is_draft = ls_item-%is_draft
                    %cid_ref = keys[ sy-tabix ]-%cid_ref
*                    Salesorderid = lv_salesorderid
                    %param = VALUE #(
                               salesorderid  = ls_item-salesorderid
                               itemposition  = ls_item-itemposition
                               productid     = ls_item-productid
                               notelanguage  = ls_item-notelanguage
                               currencycode  = ls_item-currencycode
                               grossamount   = ls_item-grossamount
                               netamount     = ls_item-netamount
                               taxamount     = ls_item-taxamount
                               deliverydate  = ls_item-deliverydate
                               quantity      = ls_item-quantity
                               quantityunit  = ls_item-quantityunit
                               note          = ls_item-note
                            )
                  ) ).

    ENDIF.
  ENDMETHOD.

  METHOD validate_amount.

    READ ENTITIES OF zr_order_head IN LOCAL MODE
    ENTITY item
    FIELDS ( grossamount netamount taxamount ) WITH CORRESPONDING #(  keys  )
    RESULT DATA(lt_item_amount).

    LOOP AT lt_item_amount INTO DATA(ls_item_amount).

      IF ls_item_amount-Grossamount <= 0 OR ls_item_amount-netamount <= 0 OR ls_item_amount-taxamount <= 0.

        IF ls_item_amount-Grossamount <= 0.
          DATA(lv_text) = |Gross amount must be greater than 0 for { ls_item_amount-itemposition } |.
        ELSEIF ls_item_amount-Netamount <= 0.
          lv_text = |Net amount must be greater than 0 for { ls_item_amount-itemposition } |.
        ELSEIF ls_item_amount-Taxamount <= 0.
          lv_text = |Tax amount must be greater than 0 for { ls_item_amount-itemposition } |.
        ENDIF.

        APPEND VALUE #( %tky = keys[ sy-tabix ]-%tky
                            %element-grossamount = if_abap_behv=>mk-on
                            %msg = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-error

                                      text     = lv_text  ) )
                                      TO reported-item.

        APPEND VALUE #( %is_draft = keys[ sy-tabix ]-%is_draft
                        salesorderid = keys[ sy-tabix ]-Salesorderid
                        itemposition = keys[ sy-tabix ]-Itemposition
                       ) TO failed-item.

        CLEAR lv_text.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD validate_quantity.

    READ ENTITIES OF zr_order_head IN LOCAL MODE
    ENTITY item
    FIELDS ( quantity ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_item_amount).

    LOOP AT lt_item_amount INTO DATA(ls_item_amount).

      IF ls_item_amount-Quantity <= 0.


        APPEND VALUE #( %tky = keys[ sy-tabix ]-%tky
                            %element-grossamount = if_abap_behv=>mk-on
                            %msg = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-error
                                      text     = |Quantity must be greater than 0 for { ls_item_amount-itemposition } |
                                      ) )
                                      TO reported-item.

        APPEND VALUE #( %is_draft = keys[ sy-tabix ]-%is_draft
                        salesorderid = keys[ sy-tabix ]-Salesorderid
                        itemposition = keys[ sy-tabix ]-Itemposition
                       ) TO failed-item.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD determine_amount.

    READ ENTITIES OF zr_order_head IN LOCAL MODE
    ENTITY head BY \_item
    FIELDS ( grossamount netamount taxamount )
    WITH VALUE #( (  %is_draft = keys[ 1 ]-%is_draft
                     %key-Salesorderid = keys[ 1 ]-salesorderid ) )
    RESULT DATA(lt_items).

    DATA(lv_grossamount) = REDUCE #( INIT x = 0
                                     FOR ls_items IN lt_items
                                     NEXT x = x + ls_items-grossamount ).

    DATA(lv_netamount) =  REDUCE #( INIT x = 0
                                    FOR ls_items IN lt_items
                                    NEXT x = x + ls_items-netamount ).

    DATA(lv_taxamount) = REDUCE #( INIT x = 0
                                    FOR ls_items IN lt_items
                                    NEXT x = x + ls_items-taxamount ).

    MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
    ENTITY head
    UPDATE FIELDS ( grossamount netamount taxamount  )
    WITH VALUE #(
               (  %is_draft = keys[ 1 ]-%is_draft
                  %key-Salesorderid = keys[ 1 ]-Salesorderid
                  grossamount = lv_grossamount
                  netamount =  lv_netamount
                  taxamount = lv_taxamount )
               )
    FAILED DATA(ls_failed_entity).

  ENDMETHOD.

  METHOD get_instance_authorizations.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_order_head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:

      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR head
        RESULT result,

      get_instance_features FOR INSTANCE FEATURES
        IMPORTING keys REQUEST requested_features FOR head RESULT result.

    METHODS refresh FOR MODIFY
      IMPORTING keys FOR ACTION head~refresh RESULT result.

    METHODS fetchdata FOR MODIFY
      IMPORTING
        keys FOR ACTION head~fetchdata RESULT result.

    METHODS determine_customername FOR DETERMINE ON MODIFY
      IMPORTING keys FOR head~determine_customername.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR head RESULT result.

    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features
      FOR head RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE head.


ENDCLASS.

CLASS lhc_zr_order_head IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD get_instance_features.

  READ ENTITIES OF zr_order_head IN LOCAL MODE
  ENTITY head
  ALL FIELDS WITH CORRESPONDING #( keys )
  RESULT DATA(lt_head).

    IF lt_head[ 1 ]-Billingstatus IS NOT INITIAL
    OR lt_head[ 1 ]-Deliverystatus IS NOT INITIAL.

      LOOP AT keys INTO DATA(ls_keys).
        APPEND VALUE     #(
                            %tky = keys[ sy-tabix ]-%tky
                            %update = if_abap_behv=>fc-o-disabled
                            %delete =  if_abap_behv=>fc-o-disabled
                            %assoc-_item = if_abap_behv=>fc-o-disabled
                          ) TO result .
      ENDLOOP.

    ELSE.
      APPEND VALUE     #(
                              %tky = keys[ 1 ]-%tky
                              %update = if_abap_behv=>fc-o-enabled
                              %delete =  if_abap_behv=>fc-o-enabled
                              %assoc-_item = if_abap_behv=>fc-o-enabled
                            ) TO result .
    ENDIF.

  ENDMETHOD.

  METHOD refresh.

    DATA:
      ls_entity_key    TYPE zservice_consumption=>tys_sales_order,
      ls_business_data TYPE zservice_consumption=>tys_sales_order,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read,
      lt_update        TYPE TABLE FOR UPDATE zr_order_head,
      lt_create        TYPE TABLE FOR CREATE zr_order_head.


    TRY.
        " Your existing S/4HANA connection code...
        DATA(lo_destination) = cl_http_destination_provider=>create_by_url(
          'https://sapes5.sapdevcenter.com'
        ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        lo_http_client->get_http_request( )->set_authorization_basic(
          i_username = 'S0025726574'
          i_password = 'Sap@7161'
        ).

        lo_http_client->get_http_request( )->set_header_field(
          i_name  = 'sap-client'
          i_value = '002'
        ).

        lo_http_client->get_http_request( )->set_header_field(
          i_name  = 'Accept'
          i_value = 'application/json'
        ).

        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
            is_proxy_model_key = VALUE #(
              repository_id       = 'DEFAULT'
              proxy_model_id      = 'ZSERVICE_CONSUMPTION'
              proxy_model_version = '0001'
            )
            io_http_client         = lo_http_client
            iv_relative_service_root = '/sap/opu/odata/iwbep/GWSAMPLE_BASIC/'
        ).

        IF lo_client_proxy IS NOT BOUND.
          RETURN.
        ENDIF.

        DATA(lv_salesorderid) = keys[ 1 ]-Salesorderid.
        ls_entity_key = VALUE #( sales_order_id = lv_salesorderid ).

        lo_resource = lo_client_proxy->create_resource_for_entity_set( 'SALES_ORDER_SET' )->navigate_with_key( ls_entity_key ).
        lo_request = lo_resource->create_request_for_read( ).
        lo_response = lo_request->execute( ).

        " Get business data
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

        IF ls_business_data IS INITIAL.

          reported-head =  VALUE #(
                 (
                      %tky-Salesorderid = lv_salesorderid
                      %is_draft = keys[ 1 ]-%is_draft
                      %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                    text   = 'No data found for Sales Order in S/4' )  )
                  ).

          RETURN.

        ENDIF.

        READ ENTITIES OF zr_order_head IN LOCAL MODE
        ENTITY head
        ALL FIELDS
        WITH VALUE #( (  %key-Salesorderid = lv_salesorderid ) )
        RESULT DATA(lt_head).

        IF lt_head IS NOT INITIAL.

          lt_update = VALUE #(
            (
              %tky = keys[ 1 ]-%tky  " Use the current entity's key
              note = ls_business_data-note
              notelanguage = ls_business_data-note_language
              customerid = ls_business_data-customer_id
              customername = ls_business_data-customer_name
              currencycode = ls_business_data-currency_code
              netamount = ls_business_data-net_amount
              grossamount = ls_business_data-gross_amount
              taxamount = ls_business_data-tax_amount
              lifecyclestatus = ls_business_data-lifecycle_status
              lifecyclestatusdescription = ls_business_data-lifecycle_status_descripti
              billingstatus = ls_business_data-billing_status
              billingstatusdescription = ls_business_data-billing_status_description
              deliverystatus = ls_business_data-delivery_status
              deliverystatusdescription = ls_business_data-delivery_status_descriptio
              Created = ls_business_data-created_at
              changed = ls_business_data-changed_at

            )
          ).

          MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
              ENTITY head
              UPDATE FIELDS ( note notelanguage customerid customername currencycode grossamount
               netamount taxamount lifecyclestatus lifecyclestatusdescription billingstatus
               billingstatusdescription deliverystatus deliverystatusdescription created changed
                )
              WITH lt_update
              MAPPED DATA(ls_upd_mapped)
              FAILED DATA(ls_upd_failed)
              REPORTED DATA(ls_upd_reported).

        ELSE.

          lt_create = VALUE #(
            (
              %key-Salesorderid = lv_salesorderid  " Use the current entity's key
              %is_draft = keys[ 1 ]-%is_draft
              %cid = 'CID_CREATE'
              note = ls_business_data-note
              notelanguage = ls_business_data-note_language
              customerid = ls_business_data-customer_id
              customername = ls_business_data-customer_name
              currencycode = ls_business_data-currency_code
              netamount = ls_business_data-net_amount
              grossamount = ls_business_data-gross_amount
              taxamount = ls_business_data-tax_amount
              lifecyclestatus = ls_business_data-lifecycle_status
              lifecyclestatusdescription = ls_business_data-lifecycle_status_descripti
              billingstatus = ls_business_data-billing_status
              billingstatusdescription = ls_business_data-billing_status_description
              deliverystatus = ls_business_data-delivery_status
              deliverystatusdescription = ls_business_data-delivery_status_descriptio
              Created = ls_business_data-created_at
              changed = ls_business_data-changed_at
            )
          ).

          MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
              ENTITY head
              CREATE FIELDS ( salesorderid note notelanguage customerid customername currencycode grossamount
               netamount taxamount lifecyclestatus lifecyclestatusdescription billingstatus
               billingstatusdescription deliverystatus deliverystatusdescription created changed
                )
              WITH lt_create
              MAPPED DATA(ls_crt_mapped)
              FAILED DATA(ls_crt_failed)
              REPORTED DATA(ls_crt_reported).

        ENDIF.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).

        reported-head =  VALUE #(
                       (
                            %tky-Salesorderid = lv_salesorderid
                            %is_draft = keys[ 1 ]-%is_draft
                            %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                          text   = 'No data found for Sales Order in S/4' )  )
                        ).

        APPEND VALUE #( %is_draft = keys[ 1 ]-%is_draft
                        salesorderid = keys[ 1 ]-Salesorderid
                       ) TO failed-head.

        RETURN.

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).

      CATCH cx_http_dest_provider_error INTO DATA(lx_CX_HTTP_DEST_PROVIDER_ERROR).

    ENDTRY.

    IF ls_upd_failed IS INITIAL.

      result = VALUE #(
                      (  %is_draft = keys[ 1 ]-%is_draft
                         %cid_ref = keys[ 1 ]-%cid_ref
                         Salesorderid = lv_salesorderid
                         %param = VALUE #(
          salesorderid = ls_business_data-sales_order_id
          note = ls_business_data-note
          notelanguage = ls_business_data-note_language
          customerid = ls_business_data-customer_id
          customername = ls_business_data-customer_name
          currencycode = ls_business_data-currency_code
          netamount = ls_business_data-net_amount
          grossamount = ls_business_data-gross_amount
          taxamount = ls_business_data-tax_amount
          lifecyclestatus = ls_business_data-lifecycle_status
          lifecyclestatusdescription = ls_business_data-lifecycle_status_descripti
          billingstatus = ls_business_data-billing_status
          billingstatusdescription = ls_business_data-billing_status_description
          deliverystatus = ls_business_data-delivery_status
          deliverystatusdescription = ls_business_data-delivery_status_descriptio )
          )
          ).

      READ ENTITIES OF zr_order_head IN LOCAL MODE
      ENTITY head
      ALL FIELDS
      WITH VALUE #( (  %key-Salesorderid = lv_salesorderid ) )
      RESULT lt_head.

      MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
      ENTITY item
      EXECUTE refreshitem
      FROM VALUE #( ( salesorderid = lv_salesorderid ) )
      FAILED DATA(ls_item_failed)
      MAPPED DATA(ls_item_mapped)
      REPORTED DATA(ls_item_reported).

      reported-head =  VALUE #(
                     (
                          %tky-Salesorderid = lv_salesorderid
                          %is_draft = lt_head[ 1 ]-%is_draft
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                        text   = 'Data fetched successfully' )  )
        ).

    ENDIF.

  ENDMETHOD.


  METHOD fetchdata.

*
    " First execute the refresh action to update the data
    MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
      ENTITY head
      EXECUTE refresh
      FROM VALUE #( ( %key-Salesorderid = keys[ 1 ]-%param-salesorderid ) )
      FAILED DATA(ls_refresh_failed)
      MAPPED DATA(ls_refresh_mapped)
      REPORTED DATA(ls_refresh_reported).

    " Check if refresh was successful
    IF ls_refresh_failed IS NOT INITIAL.
      " Handle refresh failure
      reported-head = ls_refresh_reported-head.
      RETURN.
    ENDIF.

    " Read the updated entity data
    READ ENTITIES OF zr_order_head IN LOCAL MODE
      ENTITY head
      ALL FIELDS
      WITH VALUE #( ( %key-Salesorderid = keys[ 1 ]-%param-salesorderid ) )
      RESULT DATA(lt_head)
      FAILED DATA(ls_read_failed)
      REPORTED DATA(ls_read_reported).

    " Check if read was successful
    IF ls_read_failed IS NOT INITIAL OR lines( lt_head ) = 0.
      " Handle read failure or no data found
      reported-head = ls_read_reported-head.
      " Add custom message if needed
      APPEND VALUE #(
        %key-Salesorderid = keys[ 1 ]-%param-salesorderid
        %msg = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text = |No data found for Sales Order { keys[ 1 ]-%param-salesorderid }|
        )
      ) TO reported-head.
      RETURN.
    ENDIF.

    " For static actions, result structure contains only %cid and %param
    " The %param should contain the entity data
    result = VALUE #(
      (
        %cid = keys[ 1 ]-%cid
        %param = VALUE #(
          salesorderid = lt_head[ 1 ]-Salesorderid
          note = lt_head[ 1 ]-Note
          notelanguage = lt_head[ 1 ]-Notelanguage
          customerid = lt_head[ 1 ]-Customerid
          customername = lt_head[ 1 ]-Customername
          currencycode = lt_head[ 1 ]-Currencycode
          netamount = lt_head[ 1 ]-Netamount
          grossamount = lt_head[ 1 ]-Grossamount
          taxamount = lt_head[ 1 ]-Taxamount
          lifecyclestatus = lt_head[ 1 ]-Lifecyclestatus
          lifecyclestatusdescription = lt_head[ 1 ]-Lifecyclestatusdescription
          billingstatus = lt_head[ 1 ]-Billingstatus
          billingstatusdescription = lt_head[ 1 ]-Billingstatusdescription
          deliverystatus = lt_head[ 1 ]-Deliverystatus
          deliverystatusdescription = lt_head[ 1 ]-Deliverystatusdescription
        )
      )
    ).

    " Merge all reported messages
    APPEND LINES OF ls_refresh_reported-head TO reported-head.
    APPEND LINES OF ls_read_reported-head TO reported-head.

  ENDMETHOD.

  METHOD earlynumbering_create.

    LOOP AT entities INTO DATA(ls_entity).

      IF ls_entity-Salesorderid IS INITIAL.
        TRY.
            CALL METHOD cl_numberrange_runtime=>number_get
              EXPORTING
                nr_range_nr = '01'
                object      = 'ZNUM_RANGE'
              IMPORTING
                number      = DATA(lv_number)
                returncode  = DATA(lv_rcode).


          CATCH cx_number_ranges.

        ENDTRY.

        IF lv_rcode = 0.

          SHIFT lv_number LEFT DELETING LEADING '0'.

          APPEND VALUE #(
                        %cid = ls_entity-%cid
                        salesorderid = lv_number
                        %is_draft = ls_entity-%is_draft
                         ) TO mapped-head.

        ENDIF.

      ELSE.
        APPEND VALUE #(
              %cid = ls_entity-%cid
              salesorderid = LS_entity-Salesorderid
              %is_draft = ls_entity-%is_draft
               ) TO mapped-head.


      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD determine_customername.

    DATA : lt_customer TYPE STANDARD TABLE OF zcustomer_head,
           ls_customer TYPE zcustomer_head.

    READ ENTITIES OF zr_order_head IN LOCAL MODE
    ENTITY head
    FIELDS ( customerid customername )
    WITH VALUE #( (
                    Salesorderid = keys[ 1 ]-Salesorderid
                    %is_draft = keys[ 1 ]-%is_draft ) )
    RESULT DATA(lt_head)
    FAILED DATA(ls_failed).

    IF ls_failed IS INITIAL.

      DATA(lv_customerid) = lt_head[ 1 ]-Customerid.

      SELECT SINGLE * FROM zcustomer_head
      WHERE customerid = @lv_customerid
      INTO @ls_customer.

      IF ls_customer IS NOT INITIAL.

        MODIFY ENTITIES OF zr_order_head IN LOCAL MODE
        ENTITY head
        UPDATE FIELDS ( customername )
        WITH VALUE #( ( Salesorderid = keys[ 1 ]-Salesorderid
                        %is_draft = keys[ 1 ]-%is_draft
                        Customername = ls_customer-customername ) )
        FAILED DATA(ls_failed_upd).

      ENDIF.

    ENDIF.

  ENDMETHOD.

  METHOD get_instance_authorizations.



  ENDMETHOD.

  METHOD get_global_features.


  ENDMETHOD.

ENDCLASS.
