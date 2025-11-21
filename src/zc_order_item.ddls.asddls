@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection view for items'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_ORDER_ITEM as projection on ZR_ORDER_ITEM
{
key Salesorderid,
key Itemposition,
Productid,
Notelanguage,
Currencycode,
@Semantics.amount.currencyCode : 'currencycode'
Grossamount,
@Semantics.amount.currencyCode : 'currencycode'
Netamount,
@Semantics.amount.currencyCode : 'currencycode'
Taxamount,
Deliverydate,
@Semantics.quantity.unitOfMeasure : 'quantityunit'
Quantity,
Quantityunit,
Note,

/* Associations */
_head: redirected to parent ZC_ORDER_HEAD
}
