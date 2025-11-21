@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View entity for item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED
}
define view entity ZR_ORDER_ITEM
  as select from zorder_item as item
  association to parent ZR_ORDER_HEAD as _head on $projection.Salesorderid = _head.Salesorderid

{
  key salesorderid as Salesorderid,
  key itemposition as Itemposition,
      productid    as Productid,
      notelanguage as Notelanguage,
      currencycode as Currencycode,
      @Semantics.amount.currencyCode : 'currencycode'
      grossamount  as Grossamount,
      @Semantics.amount.currencyCode : 'currencycode'
      netamount    as Netamount,
      @Semantics.amount.currencyCode : 'currencycode'
      taxamount    as Taxamount,
      deliverydate as Deliverydate,
      @Semantics.quantity.unitOfMeasure : 'quantityunit'
      quantity     as Quantity,
      quantityunit as Quantityunit,
      note         as Note,
      _head
}
