"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>GWSAMPLE_BASIC</em>
CLASS zservice_consumption DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type NO_OF_SALES_ORDERS
        no_of_sales_orders TYPE int4,
        "! Used for primitive type SALES_ORDER_ID
        sales_order_id     TYPE c LENGTH 10,
        "! Used for primitive type SALES_ORDER_ID_2
        sales_order_id_2   TYPE c LENGTH 10,
        "! Used for primitive type SALES_ORDER_ID_3
        sales_order_id_3   TYPE c LENGTH 10,
        "! Used for primitive type SALES_ORDER_ID_4
        sales_order_id_4   TYPE c LENGTH 10,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">CT_Address</p>
      BEGIN OF tys_ct_address,
        "! City
        city         TYPE c LENGTH 40,
        "! PostalCode
        postal_code  TYPE c LENGTH 10,
        "! Street
        street       TYPE c LENGTH 60,
        "! Building
        building     TYPE c LENGTH 10,
        "! Country
        country      TYPE c LENGTH 3,
        "! AddressType
        address_type TYPE c LENGTH 2,
      END OF tys_ct_address,
      "! <p class="shorttext synchronized">List of CT_Address</p>
      tyt_ct_address TYPE STANDARD TABLE OF tys_ct_address WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">CT_String</p>
      BEGIN OF tys_ct_string,
        "! String
        string TYPE string,
      END OF tys_ct_string,
      "! <p class="shorttext synchronized">List of CT_String</p>
      tyt_ct_string TYPE STANDARD TABLE OF tys_ct_string WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function RegenerateAllData</p>
      "! <em>with the internal name</em> REGENERATE_ALL_DATA
      BEGIN OF tys_parameters_1,
        "! NoOfSalesOrders
        no_of_sales_orders TYPE int4,
      END OF tys_parameters_1,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_1</p>
      tyt_parameters_1 TYPE STANDARD TABLE OF tys_parameters_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function SalesOrder_Cancel</p>
      "! <em>with the internal name</em> SALES_ORDER_CANCEL
      BEGIN OF tys_parameters_2,
        "! SalesOrderID
        sales_order_id TYPE c LENGTH 10,
      END OF tys_parameters_2,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_2</p>
      tyt_parameters_2 TYPE STANDARD TABLE OF tys_parameters_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function SalesOrder_Confirm</p>
      "! <em>with the internal name</em> SALES_ORDER_CONFIRM
      BEGIN OF tys_parameters_3,
        "! SalesOrderID
        sales_order_id TYPE c LENGTH 10,
      END OF tys_parameters_3,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_3</p>
      tyt_parameters_3 TYPE STANDARD TABLE OF tys_parameters_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function SalesOrder_GoodsIssueCreated</p>
      "! <em>with the internal name</em> SALES_ORDER_GOODS_ISSUE_CR
      BEGIN OF tys_parameters_4,
        "! SalesOrderID
        sales_order_id TYPE c LENGTH 10,
      END OF tys_parameters_4,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_4</p>
      tyt_parameters_4 TYPE STANDARD TABLE OF tys_parameters_4 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function SalesOrder_InvoiceCreated</p>
      "! <em>with the internal name</em> SALES_ORDER_INVOICE_CREATE
      BEGIN OF tys_parameters_5,
        "! SalesOrderID
        sales_order_id TYPE c LENGTH 10,
      END OF tys_parameters_5,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_5</p>
      tyt_parameters_5 TYPE STANDARD TABLE OF tys_parameters_5 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">BusinessPartner</p>
      BEGIN OF tys_business_partner,
        "! Address
        address               TYPE tys_ct_address,
        "! <em>Key property</em> BusinessPartnerID
        business_partner_id   TYPE c LENGTH 10,
        "! CompanyName
        company_name          TYPE c LENGTH 80,
        "! WebAddress
        web_address           TYPE string,
        "! EmailAddress
        email_address         TYPE c LENGTH 255,
        "! PhoneNumber
        phone_number          TYPE c LENGTH 30,
        "! FaxNumber
        fax_number            TYPE c LENGTH 30,
        "! LegalForm
        legal_form            TYPE c LENGTH 10,
        "! CurrencyCode
        currency_code         TYPE c LENGTH 5,
        "! BusinessPartnerRole
        business_partner_role TYPE c LENGTH 3,
        "! CreatedAt
        created_at            TYPE timestampl,
        "! ChangedAt
        changed_at            TYPE timestampl,
        "! odata.etag
        etag                  TYPE string,
      END OF tys_business_partner,
      "! <p class="shorttext synchronized">List of BusinessPartner</p>
      tyt_business_partner TYPE STANDARD TABLE OF tys_business_partner WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Contact</p>
      BEGIN OF tys_contact,
        "! Address
        address             TYPE tys_ct_address,
        "! <em>Key property</em> ContactGuid
        contact_guid        TYPE sysuuid_x16,
        "! BusinessPartnerID
        business_partner_id TYPE c LENGTH 10,
        "! Title
        title               TYPE c LENGTH 10,
        "! FirstName
        first_name          TYPE c LENGTH 40,
        "! MiddleName
        middle_name         TYPE c LENGTH 40,
        "! LastName
        last_name           TYPE c LENGTH 40,
        "! Nickname
        nickname            TYPE c LENGTH 40,
        "! Initials
        initials            TYPE c LENGTH 10,
        "! Sex
        sex                 TYPE c LENGTH 1,
        "! PhoneNumber
        phone_number        TYPE c LENGTH 30,
        "! FaxNumber
        fax_number          TYPE c LENGTH 30,
        "! EmailAddress
        email_address       TYPE c LENGTH 255,
        "! Language
        language            TYPE c LENGTH 2,
        "! DateOfBirth
        date_of_birth       TYPE timestampl,
      END OF tys_contact,
      "! <p class="shorttext synchronized">List of Contact</p>
      tyt_contact TYPE STANDARD TABLE OF tys_contact WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Product</p>
      BEGIN OF tys_product,
        "! <em>Key property</em> ProductID
        product_id           TYPE c LENGTH 10,
        "! TypeCode
        type_code            TYPE c LENGTH 2,
        "! Category
        category             TYPE c LENGTH 40,
        "! Name
        name                 TYPE c LENGTH 255,
        "! NameLanguage
        name_language        TYPE c LENGTH 2,
        "! Description
        description          TYPE c LENGTH 255,
        "! DescriptionLanguage
        description_language TYPE c LENGTH 2,
        "! SupplierID
        supplier_id          TYPE c LENGTH 10,
        "! SupplierName
        supplier_name        TYPE c LENGTH 80,
        "! TaxTarifCode
        tax_tarif_code       TYPE int1,
        "! MeasureUnit
        measure_unit         TYPE c LENGTH 3,
        "! WeightMeasure
        weight_measure       TYPE p LENGTH 7 DECIMALS 3,
        "! WeightUnit
        weight_unit          TYPE c LENGTH 3,
        "! CurrencyCode
        currency_code        TYPE c LENGTH 5,
        "! Price
        price                TYPE p LENGTH 9 DECIMALS 3,
        "! Width
        width                TYPE p LENGTH 7 DECIMALS 3,
        "! Depth
        depth                TYPE p LENGTH 7 DECIMALS 3,
        "! Height
        height               TYPE p LENGTH 7 DECIMALS 3,
        "! DimUnit
        dim_unit             TYPE c LENGTH 3,
        "! CreatedAt
        created_at           TYPE timestampl,
        "! ChangedAt
        changed_at           TYPE timestampl,
        "! odata.etag
        etag                 TYPE string,
      END OF tys_product,
      "! <p class="shorttext synchronized">List of Product</p>
      tyt_product TYPE STANDARD TABLE OF tys_product WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrder</p>
      BEGIN OF tys_sales_order,
        "! <em>Key property</em> SalesOrderID
        sales_order_id             TYPE c LENGTH 10,
        "! Note
        note                       TYPE c LENGTH 255,
        "! NoteLanguage
        note_language              TYPE c LENGTH 2,
        "! CustomerID
        customer_id                TYPE c LENGTH 10,
        "! CustomerName
        customer_name              TYPE c LENGTH 80,
        "! CurrencyCode
        currency_code              TYPE c LENGTH 5,
        "! GrossAmount
        gross_amount               TYPE p LENGTH 9 DECIMALS 3,
        "! NetAmount
        net_amount                 TYPE p LENGTH 9 DECIMALS 3,
        "! TaxAmount
        tax_amount                 TYPE p LENGTH 9 DECIMALS 3,
        "! LifecycleStatus
        lifecycle_status           TYPE c LENGTH 1,
        "! LifecycleStatusDescription
        lifecycle_status_descripti TYPE c LENGTH 60,
        "! BillingStatus
        billing_status             TYPE c LENGTH 1,
        "! BillingStatusDescription
        billing_status_description TYPE c LENGTH 60,
        "! DeliveryStatus
        delivery_status            TYPE c LENGTH 1,
        "! DeliveryStatusDescription
        delivery_status_descriptio TYPE c LENGTH 60,
        "! CreatedAt
        created_at                 TYPE timestampl,
        "! ChangedAt
        changed_at                 TYPE timestampl,
      END OF tys_sales_order,
      "! <p class="shorttext synchronized">List of SalesOrder</p>
      tyt_sales_order TYPE STANDARD TABLE OF tys_sales_order WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderLineItem</p>
      BEGIN OF tys_sales_order_line_item,
        "! <em>Key property</em> SalesOrderID
        sales_order_id TYPE c LENGTH 10,
        "! <em>Key property</em> ItemPosition
        item_position  TYPE c LENGTH 10,
        "! ProductID
        product_id     TYPE c LENGTH 10,
        "! Note
        note           TYPE c LENGTH 255,
        "! NoteLanguage
        note_language  TYPE c LENGTH 2,
        "! CurrencyCode
        currency_code  TYPE c LENGTH 5,
        "! GrossAmount
        gross_amount   TYPE p LENGTH 9 DECIMALS 3,
        "! NetAmount
        net_amount     TYPE p LENGTH 9 DECIMALS 3,
        "! TaxAmount
        tax_amount     TYPE p LENGTH 9 DECIMALS 3,
        "! DeliveryDate
        delivery_date  TYPE timestampl,
        "! Quantity
        quantity       TYPE p LENGTH 7 DECIMALS 3,
        "! QuantityUnit
        quantity_unit  TYPE c LENGTH 3,
      END OF tys_sales_order_line_item,
      "! <p class="shorttext synchronized">List of SalesOrderLineItem</p>
      tyt_sales_order_line_item TYPE STANDARD TABLE OF tys_sales_order_line_item WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_AddressType</p>
      BEGIN OF tys_vh_address_type,
        "! <em>Key property</em> AddressType
        address_type TYPE c LENGTH 2,
        "! Shorttext
        shorttext    TYPE c LENGTH 60,
      END OF tys_vh_address_type,
      "! <p class="shorttext synchronized">List of VH_AddressType</p>
      tyt_vh_address_type TYPE STANDARD TABLE OF tys_vh_address_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_BPRole</p>
      BEGIN OF tys_vh_bprole,
        "! <em>Key property</em> BpRole
        bp_role   TYPE c LENGTH 3,
        "! Shorttext
        shorttext TYPE c LENGTH 60,
      END OF tys_vh_bprole,
      "! <p class="shorttext synchronized">List of VH_BPRole</p>
      tyt_vh_bprole TYPE STANDARD TABLE OF tys_vh_bprole WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_Category</p>
      BEGIN OF tys_vh_category,
        "! <em>Key property</em> Category
        category TYPE c LENGTH 40,
      END OF tys_vh_category,
      "! <p class="shorttext synchronized">List of VH_Category</p>
      tyt_vh_category TYPE STANDARD TABLE OF tys_vh_category WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_Country</p>
      BEGIN OF tys_vh_country,
        "! <em>Key property</em> Land1
        land_1 TYPE c LENGTH 3,
        "! Landx
        landx  TYPE c LENGTH 15,
        "! Natio
        natio  TYPE c LENGTH 15,
      END OF tys_vh_country,
      "! <p class="shorttext synchronized">List of VH_Country</p>
      tyt_vh_country TYPE STANDARD TABLE OF tys_vh_country WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_Currency</p>
      BEGIN OF tys_vh_currency,
        "! <em>Key property</em> Waers
        waers TYPE c LENGTH 5,
        "! Ltext
        ltext TYPE c LENGTH 40,
      END OF tys_vh_currency,
      "! <p class="shorttext synchronized">List of VH_Currency</p>
      tyt_vh_currency TYPE STANDARD TABLE OF tys_vh_currency WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_Language</p>
      BEGIN OF tys_vh_language,
        "! <em>Key property</em> Spras
        spras TYPE c LENGTH 2,
        "! Sptxt
        sptxt TYPE c LENGTH 16,
      END OF tys_vh_language,
      "! <p class="shorttext synchronized">List of VH_Language</p>
      tyt_vh_language TYPE STANDARD TABLE OF tys_vh_language WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_ProductTypeCode</p>
      BEGIN OF tys_vh_product_type_code,
        "! <em>Key property</em> TypeCode
        type_code TYPE c LENGTH 2,
        "! Shorttext
        shorttext TYPE c LENGTH 60,
      END OF tys_vh_product_type_code,
      "! <p class="shorttext synchronized">List of VH_ProductTypeCode</p>
      tyt_vh_product_type_code TYPE STANDARD TABLE OF tys_vh_product_type_code WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_Sex</p>
      BEGIN OF tys_vh_sex,
        "! <em>Key property</em> Sex
        sex       TYPE c LENGTH 1,
        "! Shorttext
        shorttext TYPE c LENGTH 60,
      END OF tys_vh_sex,
      "! <p class="shorttext synchronized">List of VH_Sex</p>
      tyt_vh_sex TYPE STANDARD TABLE OF tys_vh_sex WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_UnitLength</p>
      BEGIN OF tys_vh_unit_length,
        "! <em>Key property</em> Msehi
        msehi TYPE c LENGTH 3,
        "! Msehl
        msehl TYPE c LENGTH 30,
      END OF tys_vh_unit_length,
      "! <p class="shorttext synchronized">List of VH_UnitLength</p>
      tyt_vh_unit_length TYPE STANDARD TABLE OF tys_vh_unit_length WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_UnitQuantity</p>
      BEGIN OF tys_vh_unit_quantity,
        "! <em>Key property</em> Msehi
        msehi TYPE c LENGTH 3,
        "! Msehl
        msehl TYPE c LENGTH 30,
      END OF tys_vh_unit_quantity,
      "! <p class="shorttext synchronized">List of VH_UnitQuantity</p>
      tyt_vh_unit_quantity TYPE STANDARD TABLE OF tys_vh_unit_quantity WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VH_UnitWeight</p>
      BEGIN OF tys_vh_unit_weight,
        "! <em>Key property</em> Msehi
        msehi TYPE c LENGTH 3,
        "! Msehl
        msehl TYPE c LENGTH 30,
      END OF tys_vh_unit_weight,
      "! <p class="shorttext synchronized">List of VH_UnitWeight</p>
      tyt_vh_unit_weight TYPE STANDARD TABLE OF tys_vh_unit_weight WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! BusinessPartnerSet
        "! <br/> Collection of type 'BusinessPartner'
        business_partner_set      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BUSINESS_PARTNER_SET',
        "! ContactSet
        "! <br/> Collection of type 'Contact'
        contact_set               TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CONTACT_SET',
        "! ProductSet
        "! <br/> Collection of type 'Product'
        product_set               TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PRODUCT_SET',
        "! SalesOrderLineItemSet
        "! <br/> Collection of type 'SalesOrderLineItem'
        sales_order_line_item_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_LINE_ITEM_SET',
        "! SalesOrderSet
        "! <br/> Collection of type 'SalesOrder'
        sales_order_set           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_SET',
        "! VH_AddressTypeSet
        "! <br/> Collection of type 'VH_AddressType'
        vh_address_type_set       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_ADDRESS_TYPE_SET',
        "! VH_BPRoleSet
        "! <br/> Collection of type 'VH_BPRole'
        vh_bprole_set             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_BPROLE_SET',
        "! VH_CategorySet
        "! <br/> Collection of type 'VH_Category'
        vh_category_set           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_CATEGORY_SET',
        "! VH_CountrySet
        "! <br/> Collection of type 'VH_Country'
        vh_country_set            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_COUNTRY_SET',
        "! VH_CurrencySet
        "! <br/> Collection of type 'VH_Currency'
        vh_currency_set           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_CURRENCY_SET',
        "! VH_LanguageSet
        "! <br/> Collection of type 'VH_Language'
        vh_language_set           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_LANGUAGE_SET',
        "! VH_ProductTypeCodeSet
        "! <br/> Collection of type 'VH_ProductTypeCode'
        vh_product_type_code_set  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_PRODUCT_TYPE_CODE_SET',
        "! VH_SexSet
        "! <br/> Collection of type 'VH_Sex'
        vh_sex_set                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_SEX_SET',
        "! VH_UnitLengthSet
        "! <br/> Collection of type 'VH_UnitLength'
        vh_unit_length_set        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_UNIT_LENGTH_SET',
        "! VH_UnitQuantitySet
        "! <br/> Collection of type 'VH_UnitQuantity'
        vh_unit_quantity_set      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_UNIT_QUANTITY_SET',
        "! VH_UnitWeightSet
        "! <br/> Collection of type 'VH_UnitWeight'
        vh_unit_weight_set        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VH_UNIT_WEIGHT_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the function imports</p>
      BEGIN OF gcs_function_import,
        "! RegenerateAllData
        "! <br/> See structure type {@link ..tys_parameters_1} for the parameters
        regenerate_all_data        TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'REGENERATE_ALL_DATA',
        "! SalesOrder_Cancel
        "! <br/> See structure type {@link ..tys_parameters_2} for the parameters
        sales_order_cancel         TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'SALES_ORDER_CANCEL',
        "! SalesOrder_Confirm
        "! <br/> See structure type {@link ..tys_parameters_3} for the parameters
        sales_order_confirm        TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'SALES_ORDER_CONFIRM',
        "! SalesOrder_GoodsIssueCreated
        "! <br/> See structure type {@link ..tys_parameters_4} for the parameters
        sales_order_goods_issue_cr TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'SALES_ORDER_GOODS_ISSUE_CR',
        "! SalesOrder_InvoiceCreated
        "! <br/> See structure type {@link ..tys_parameters_5} for the parameters
        sales_order_invoice_create TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'SALES_ORDER_INVOICE_CREATE',
      END OF gcs_function_import.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for CT_Address</p>
        "! See also structure type {@link ..tys_ct_address}
        BEGIN OF ct_address,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF ct_address,
        "! <p class="shorttext synchronized">Internal names for CT_String</p>
        "! See also structure type {@link ..tys_ct_string}
        BEGIN OF ct_string,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF ct_string,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for BusinessPartner</p>
        "! See also structure type {@link ..tys_business_partner}
        BEGIN OF business_partner,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! ToContacts
            to_contacts     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CONTACTS',
            "! ToProducts
            to_products     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PRODUCTS',
            "! ToSalesOrders
            to_sales_orders TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SALES_ORDERS',
          END OF navigation,
        END OF business_partner,
        "! <p class="shorttext synchronized">Internal names for Contact</p>
        "! See also structure type {@link ..tys_contact}
        BEGIN OF contact,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! ToBusinessPartner
            to_business_partner TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER',
          END OF navigation,
        END OF contact,
        "! <p class="shorttext synchronized">Internal names for Product</p>
        "! See also structure type {@link ..tys_product}
        BEGIN OF product,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! ToSalesOrderLineItems
            to_sales_order_line_items TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SALES_ORDER_LINE_ITEMS',
            "! ToSupplier
            to_supplier               TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER',
          END OF navigation,
        END OF product,
        "! <p class="shorttext synchronized">Internal names for SalesOrder</p>
        "! See also structure type {@link ..tys_sales_order}
        BEGIN OF sales_order,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! ToBusinessPartner
            to_business_partner TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BUSINESS_PARTNER',
            "! ToLineItems
            to_line_items       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_LINE_ITEMS',
          END OF navigation,
        END OF sales_order,
        "! <p class="shorttext synchronized">Internal names for SalesOrderLineItem</p>
        "! See also structure type {@link ..tys_sales_order_line_item}
        BEGIN OF sales_order_line_item,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! ToHeader
            to_header  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_HEADER',
            "! ToProduct
            to_product TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PRODUCT',
          END OF navigation,
        END OF sales_order_line_item,
        "! <p class="shorttext synchronized">Internal names for VH_AddressType</p>
        "! See also structure type {@link ..tys_vh_address_type}
        BEGIN OF vh_address_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_address_type,
        "! <p class="shorttext synchronized">Internal names for VH_BPRole</p>
        "! See also structure type {@link ..tys_vh_bprole}
        BEGIN OF vh_bprole,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_bprole,
        "! <p class="shorttext synchronized">Internal names for VH_Category</p>
        "! See also structure type {@link ..tys_vh_category}
        BEGIN OF vh_category,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_category,
        "! <p class="shorttext synchronized">Internal names for VH_Country</p>
        "! See also structure type {@link ..tys_vh_country}
        BEGIN OF vh_country,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_country,
        "! <p class="shorttext synchronized">Internal names for VH_Currency</p>
        "! See also structure type {@link ..tys_vh_currency}
        BEGIN OF vh_currency,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_currency,
        "! <p class="shorttext synchronized">Internal names for VH_Language</p>
        "! See also structure type {@link ..tys_vh_language}
        BEGIN OF vh_language,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_language,
        "! <p class="shorttext synchronized">Internal names for VH_ProductTypeCode</p>
        "! See also structure type {@link ..tys_vh_product_type_code}
        BEGIN OF vh_product_type_code,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_product_type_code,
        "! <p class="shorttext synchronized">Internal names for VH_Sex</p>
        "! See also structure type {@link ..tys_vh_sex}
        BEGIN OF vh_sex,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_sex,
        "! <p class="shorttext synchronized">Internal names for VH_UnitLength</p>
        "! See also structure type {@link ..tys_vh_unit_length}
        BEGIN OF vh_unit_length,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_unit_length,
        "! <p class="shorttext synchronized">Internal names for VH_UnitQuantity</p>
        "! See also structure type {@link ..tys_vh_unit_quantity}
        BEGIN OF vh_unit_quantity,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_unit_quantity,
        "! <p class="shorttext synchronized">Internal names for VH_UnitWeight</p>
        "! See also structure type {@link ..tys_vh_unit_weight}
        BEGIN OF vh_unit_weight,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF vh_unit_weight,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define CT_Address</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_ct_address RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CT_String</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_ct_string RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define BusinessPartner</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_business_partner RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Contact</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_contact RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Product</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_product RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrder</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderLineItem</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_line_item RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_AddressType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_address_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_BPRole</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_bprole RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_Category</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_category RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_Country</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_country RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_Currency</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_currency RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_Language</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_language RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_ProductTypeCode</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_product_type_code RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_Sex</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_sex RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_UnitLength</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_unit_length RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_UnitQuantity</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_unit_quantity RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VH_UnitWeight</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_vh_unit_weight RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define RegenerateAllData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_regenerate_all_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrder_Cancel</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_cancel RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrder_Confirm</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_confirm RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrder_GoodsIssueCreated</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_goods_issue_cr RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrder_InvoiceCreated</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_invoice_create RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSERVICE_CONSUMPTION IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'GWSAMPLE_BASIC' ) ##NO_TEXT.

    def_ct_address( ).
    def_ct_string( ).
    def_business_partner( ).
    def_contact( ).
    def_product( ).
    def_sales_order( ).
    def_sales_order_line_item( ).
    def_vh_address_type( ).
    def_vh_bprole( ).
    def_vh_category( ).
    def_vh_country( ).
    def_vh_currency( ).
    def_vh_language( ).
    def_vh_product_type_code( ).
    def_vh_sex( ).
    def_vh_unit_length( ).
    def_vh_unit_quantity( ).
    def_vh_unit_weight( ).
    def_regenerate_all_data( ).
    def_sales_order_cancel( ).
    def_sales_order_confirm( ).
    def_sales_order_goods_issue_cr( ).
    def_sales_order_invoice_create( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'NO_OF_SALES_ORDERS'
                            iv_element             = VALUE tys_types_for_prim_types-no_of_sales_orders( ) ).
    lo_primitive_type->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SALES_ORDER_ID'
                            iv_element             = VALUE tys_types_for_prim_types-sales_order_id( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SALES_ORDER_ID_2'
                            iv_element             = VALUE tys_types_for_prim_types-sales_order_id_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SALES_ORDER_ID_3'
                            iv_element             = VALUE tys_types_for_prim_types-sales_order_id_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SALES_ORDER_ID_4'
                            iv_element             = VALUE tys_types_for_prim_types-sales_order_id_4( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

  ENDMETHOD.


  METHOD def_business_partner.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'BUSINESS_PARTNER'
                                    is_structure              = VALUE tys_business_partner( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'BusinessPartner' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'BUSINESS_PARTNER_SET' ).
    lo_entity_set->set_edm_name( 'BusinessPartnerSet' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'ADDRESS' ).
    lo_complex_property->set_edm_name( 'Address' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'CT_ADDRESS' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_ID' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_NAME' ).
    lo_primitive_property->set_edm_name( 'CompanyName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEB_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'WebAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGAL_FORM' ).
    lo_primitive_property->set_edm_name( 'LegalForm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_CODE' ).
    lo_primitive_property->set_edm_name( 'CurrencyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_ROLE' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerRole' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'CreatedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_AT' ).
    lo_primitive_property->set_edm_name( 'ChangedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_CONTACTS' ).
    lo_navigation_property->set_edm_name( 'ToContacts' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CONTACT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PRODUCTS' ).
    lo_navigation_property->set_edm_name( 'ToProducts' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PRODUCT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SALES_ORDERS' ).
    lo_navigation_property->set_edm_name( 'ToSalesOrders' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_contact.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CONTACT'
                                    is_structure              = VALUE tys_contact( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Contact' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CONTACT_SET' ).
    lo_entity_set->set_edm_name( 'ContactSet' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'ADDRESS' ).
    lo_complex_property->set_edm_name( 'Address' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'CT_ADDRESS' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTACT_GUID' ).
    lo_primitive_property->set_edm_name( 'ContactGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_ID' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIRST_NAME' ).
    lo_primitive_property->set_edm_name( 'FirstName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIDDLE_NAME' ).
    lo_primitive_property->set_edm_name( 'MiddleName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_NAME' ).
    lo_primitive_property->set_edm_name( 'LastName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NICKNAME' ).
    lo_primitive_property->set_edm_name( 'Nickname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INITIALS' ).
    lo_primitive_property->set_edm_name( 'Initials' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEX' ).
    lo_primitive_property->set_edm_name( 'Sex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_OF_BIRTH' ).
    lo_primitive_property->set_edm_name( 'DateOfBirth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_BUSINESS_PARTNER' ).
    lo_navigation_property->set_edm_name( 'ToBusinessPartner' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BUSINESS_PARTNER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_ct_address.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'CT_ADDRESS'
                                    is_structure              = VALUE tys_ct_address( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'CT_Address' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'CITY' ).
    lo_primitive_property->set_edm_name( 'City' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'STREET' ).
    lo_primitive_property->set_edm_name( 'Street' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'BUILDING' ).
    lo_primitive_property->set_edm_name( 'Building' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'ADDRESS_TYPE' ).
    lo_primitive_property->set_edm_name( 'AddressType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_ct_string.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'CT_STRING'
                                    is_structure              = VALUE tys_ct_string( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'CT_String' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'STRING' ).
    lo_primitive_property->set_edm_name( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_product.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PRODUCT'
                                    is_structure              = VALUE tys_product( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Product' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PRODUCT_SET' ).
    lo_entity_set->set_edm_name( 'ProductSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_ID' ).
    lo_primitive_property->set_edm_name( 'ProductID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TYPE_CODE' ).
    lo_primitive_property->set_edm_name( 'TypeCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CATEGORY' ).
    lo_primitive_property->set_edm_name( 'Category' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'NameLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'Description' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESCRIPTION_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'DescriptionLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_ID' ).
    lo_primitive_property->set_edm_name( 'SupplierID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_NAME' ).
    lo_primitive_property->set_edm_name( 'SupplierName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_TARIF_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxTarifCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Byte' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEASURE_UNIT' ).
    lo_primitive_property->set_edm_name( 'MeasureUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEIGHT_MEASURE' ).
    lo_primitive_property->set_edm_name( 'WeightMeasure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEIGHT_UNIT' ).
    lo_primitive_property->set_edm_name( 'WeightUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_CODE' ).
    lo_primitive_property->set_edm_name( 'CurrencyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE' ).
    lo_primitive_property->set_edm_name( 'Price' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WIDTH' ).
    lo_primitive_property->set_edm_name( 'Width' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEPTH' ).
    lo_primitive_property->set_edm_name( 'Depth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HEIGHT' ).
    lo_primitive_property->set_edm_name( 'Height' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIM_UNIT' ).
    lo_primitive_property->set_edm_name( 'DimUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'CreatedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_AT' ).
    lo_primitive_property->set_edm_name( 'ChangedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SALES_ORDER_LINE_ITEMS' ).
    lo_navigation_property->set_edm_name( 'ToSalesOrderLineItems' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_LINE_ITEM' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPPLIER' ).
    lo_navigation_property->set_edm_name( 'ToSupplier' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BUSINESS_PARTNER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_regenerate_all_data.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'REGENERATE_ALL_DATA' ).
    lo_function->set_edm_name( 'RegenerateAllData' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_1( ) ).

    lo_function_import = lo_function->create_function_import( 'REGENERATE_ALL_DATA' ).
    lo_function_import->set_edm_name( 'RegenerateAllData' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'NO_OF_SALES_ORDERS' ).
    lo_parameter->set_edm_name( 'NoOfSalesOrders' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'NO_OF_SALES_ORDERS' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'CT_STRING' ).

  ENDMETHOD.


  METHOD def_sales_order.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER'
                                    is_structure              = VALUE tys_sales_order( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrder' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_SET' ).
    lo_entity_set->set_edm_name( 'SalesOrderSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ID' ).
    lo_primitive_property->set_edm_name( 'SalesOrderID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTE' ).
    lo_primitive_property->set_edm_name( 'Note' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'NoteLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_ID' ).
    lo_primitive_property->set_edm_name( 'CustomerID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_NAME' ).
    lo_primitive_property->set_edm_name( 'CustomerName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_CODE' ).
    lo_primitive_property->set_edm_name( 'CurrencyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'GrossAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'NetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'TaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFECYCLE_STATUS' ).
    lo_primitive_property->set_edm_name( 'LifecycleStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFECYCLE_STATUS_DESCRIPTI' ).
    lo_primitive_property->set_edm_name( 'LifecycleStatusDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_STATUS' ).
    lo_primitive_property->set_edm_name( 'BillingStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_STATUS_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'BillingStatusDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_STATUS' ).
    lo_primitive_property->set_edm_name( 'DeliveryStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_STATUS_DESCRIPTIO' ).
    lo_primitive_property->set_edm_name( 'DeliveryStatusDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'CreatedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_AT' ).
    lo_primitive_property->set_edm_name( 'ChangedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_BUSINESS_PARTNER' ).
    lo_navigation_property->set_edm_name( 'ToBusinessPartner' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BUSINESS_PARTNER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_LINE_ITEMS' ).
    lo_navigation_property->set_edm_name( 'ToLineItems' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_LINE_ITEM' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_sales_order_cancel.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'SALES_ORDER_CANCEL' ).
    lo_function->set_edm_name( 'SalesOrder_Cancel' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_2( ) ).

    lo_function_import = lo_function->create_function_import( 'SALES_ORDER_CANCEL' ).
    lo_function_import->set_edm_name( 'SalesOrder_Cancel' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SALES_ORDER_ID' ).
    lo_parameter->set_edm_name( 'SalesOrderID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SALES_ORDER_ID_2' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'SALES_ORDER' ).

  ENDMETHOD.


  METHOD def_sales_order_confirm.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'SALES_ORDER_CONFIRM' ).
    lo_function->set_edm_name( 'SalesOrder_Confirm' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_3( ) ).

    lo_function_import = lo_function->create_function_import( 'SALES_ORDER_CONFIRM' ).
    lo_function_import->set_edm_name( 'SalesOrder_Confirm' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SALES_ORDER_ID' ).
    lo_parameter->set_edm_name( 'SalesOrderID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SALES_ORDER_ID' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'SALES_ORDER' ).

  ENDMETHOD.


  METHOD def_sales_order_goods_issue_cr.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'SALES_ORDER_GOODS_ISSUE_CR' ).
    lo_function->set_edm_name( 'SalesOrder_GoodsIssueCreated' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_4( ) ).

    lo_function_import = lo_function->create_function_import( 'SALES_ORDER_GOODS_ISSUE_CR' ).
    lo_function_import->set_edm_name( 'SalesOrder_GoodsIssueCreated' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SALES_ORDER_ID' ).
    lo_parameter->set_edm_name( 'SalesOrderID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SALES_ORDER_ID_4' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'SALES_ORDER' ).

  ENDMETHOD.


  METHOD def_sales_order_invoice_create.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'SALES_ORDER_INVOICE_CREATE' ).
    lo_function->set_edm_name( 'SalesOrder_InvoiceCreated' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_5( ) ).

    lo_function_import = lo_function->create_function_import( 'SALES_ORDER_INVOICE_CREATE' ).
    lo_function_import->set_edm_name( 'SalesOrder_InvoiceCreated' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SALES_ORDER_ID' ).
    lo_parameter->set_edm_name( 'SalesOrderID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SALES_ORDER_ID_3' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_entity_type( 'SALES_ORDER' ).

  ENDMETHOD.


  METHOD def_sales_order_line_item.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_LINE_ITEM'
                                    is_structure              = VALUE tys_sales_order_line_item( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderLineItem' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_LINE_ITEM_SET' ).
    lo_entity_set->set_edm_name( 'SalesOrderLineItemSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ID' ).
    lo_primitive_property->set_edm_name( 'SalesOrderID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_POSITION' ).
    lo_primitive_property->set_edm_name( 'ItemPosition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_ID' ).
    lo_primitive_property->set_edm_name( 'ProductID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTE' ).
    lo_primitive_property->set_edm_name( 'Note' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'NoteLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_CODE' ).
    lo_primitive_property->set_edm_name( 'CurrencyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'GrossAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'NetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'TaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_DATE' ).
    lo_primitive_property->set_edm_name( 'DeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'QuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_HEADER' ).
    lo_navigation_property->set_edm_name( 'ToHeader' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PRODUCT' ).
    lo_navigation_property->set_edm_name( 'ToProduct' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PRODUCT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_vh_address_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_ADDRESS_TYPE'
                                    is_structure              = VALUE tys_vh_address_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_AddressType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_ADDRESS_TYPE_SET' ).
    lo_entity_set->set_edm_name( 'VH_AddressTypeSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_TYPE' ).
    lo_primitive_property->set_edm_name( 'AddressType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHORTTEXT' ).
    lo_primitive_property->set_edm_name( 'Shorttext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_bprole.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_BPROLE'
                                    is_structure              = VALUE tys_vh_bprole( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_BPRole' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_BPROLE_SET' ).
    lo_entity_set->set_edm_name( 'VH_BPRoleSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'BP_ROLE' ).
    lo_primitive_property->set_edm_name( 'BpRole' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHORTTEXT' ).
    lo_primitive_property->set_edm_name( 'Shorttext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_category.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_CATEGORY'
                                    is_structure              = VALUE tys_vh_category( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_Category' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_CATEGORY_SET' ).
    lo_entity_set->set_edm_name( 'VH_CategorySet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'CATEGORY' ).
    lo_primitive_property->set_edm_name( 'Category' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

  ENDMETHOD.


  METHOD def_vh_country.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_COUNTRY'
                                    is_structure              = VALUE tys_vh_country( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_Country' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_COUNTRY_SET' ).
    lo_entity_set->set_edm_name( 'VH_CountrySet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAND_1' ).
    lo_primitive_property->set_edm_name( 'Land1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANDX' ).
    lo_primitive_property->set_edm_name( 'Landx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NATIO' ).
    lo_primitive_property->set_edm_name( 'Natio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_currency.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_CURRENCY'
                                    is_structure              = VALUE tys_vh_currency( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_Currency' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_CURRENCY_SET' ).
    lo_entity_set->set_edm_name( 'VH_CurrencySet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LTEXT' ).
    lo_primitive_property->set_edm_name( 'Ltext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_language.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_LANGUAGE'
                                    is_structure              = VALUE tys_vh_language( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_Language' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_LANGUAGE_SET' ).
    lo_entity_set->set_edm_name( 'VH_LanguageSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPTXT' ).
    lo_primitive_property->set_edm_name( 'Sptxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_product_type_code.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_PRODUCT_TYPE_CODE'
                                    is_structure              = VALUE tys_vh_product_type_code( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_ProductTypeCode' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_PRODUCT_TYPE_CODE_SET' ).
    lo_entity_set->set_edm_name( 'VH_ProductTypeCodeSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TYPE_CODE' ).
    lo_primitive_property->set_edm_name( 'TypeCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHORTTEXT' ).
    lo_primitive_property->set_edm_name( 'Shorttext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_sex.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_SEX'
                                    is_structure              = VALUE tys_vh_sex( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_Sex' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_SEX_SET' ).
    lo_entity_set->set_edm_name( 'VH_SexSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEX' ).
    lo_primitive_property->set_edm_name( 'Sex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHORTTEXT' ).
    lo_primitive_property->set_edm_name( 'Shorttext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_unit_length.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_UNIT_LENGTH'
                                    is_structure              = VALUE tys_vh_unit_length( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_UnitLength' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_UNIT_LENGTH_SET' ).
    lo_entity_set->set_edm_name( 'VH_UnitLengthSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHI' ).
    lo_primitive_property->set_edm_name( 'Msehi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHL' ).
    lo_primitive_property->set_edm_name( 'Msehl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_unit_quantity.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_UNIT_QUANTITY'
                                    is_structure              = VALUE tys_vh_unit_quantity( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_UnitQuantity' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_UNIT_QUANTITY_SET' ).
    lo_entity_set->set_edm_name( 'VH_UnitQuantitySet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHI' ).
    lo_primitive_property->set_edm_name( 'Msehi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHL' ).
    lo_primitive_property->set_edm_name( 'Msehl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_vh_unit_weight.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VH_UNIT_WEIGHT'
                                    is_structure              = VALUE tys_vh_unit_weight( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VH_UnitWeight' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VH_UNIT_WEIGHT_SET' ).
    lo_entity_set->set_edm_name( 'VH_UnitWeightSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHI' ).
    lo_primitive_property->set_edm_name( 'Msehi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHL' ).
    lo_primitive_property->set_edm_name( 'Msehl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

  ENDMETHOD.
ENDCLASS.
