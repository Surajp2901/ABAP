@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZORDER_HEAD'
@EndUserText.label: 'Sales Order'

define root view entity ZR_ORDER_HEAD
  as select from zorder_head as head
  composition [1..*] of ZR_ORDER_ITEM as _item

{
  key salesorderid               as Salesorderid,
      note                       as Note,
      notelanguage               as Notelanguage,
      customerid                 as Customerid,
      customername               as Customername,
      currencycode               as Currencycode,
      @Semantics.amount.currencyCode: 'Currencycode'
      grossamount                as Grossamount,
      @Semantics.amount.currencyCode: 'Currencycode'
      netamount                  as Netamount,
      @Semantics.amount.currencyCode: 'Currencycode'
      taxamount                  as Taxamount,
      lifecyclestatus            as Lifecyclestatus,
      lifecyclestatusdescription as Lifecyclestatusdescription,
      billingstatus              as Billingstatus,
      billingstatusdescription   as Billingstatusdescription,
      deliverystatus             as Deliverystatus,
      deliverystatusdescription  as Deliverystatusdescription,
      created                    as Created,
      changed                    as Changed,
      @Semantics.systemDateTime.lastChangedAt: true
      locallastchangedat         as Locallastchangedat,
      @Semantics.systemDateTime.createdAt: true
      localcreatedat             as localCreatedat,
      @Semantics.user.lastChangedBy: true
      localchangedby             as localchangedby,
      @UI.hidden: true
      localcreatedby             as localcreatedby,
      @UI.hidden: true

      _item
}
