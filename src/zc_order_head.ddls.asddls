@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
label: 'Order projection view'
}
@ObjectModel: {
sapObjectNodeType.name: 'ZORDER_HEAD'
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_ORDER_HEAD
  provider contract transactional_query
  as projection on ZR_ORDER_HEAD
  association [0..1] to ZR_CUSTOMER_HEAD as _customer on $projection.Customerid = _customer.Customerid

{
  key Salesorderid,
      Note,
      Notelanguage,
      @Consumption.valueHelpDefinition: [{  
      entity: { name: 'ZR_CUSTOMER_HEAD' ,
      element: 'Customerid'  } }]
      Customerid,
      Customername,
      @Consumption: {
      valueHelpDefinition: [ {
      entity.element: 'Currency',
      entity.name: 'I_CurrencyStdVH',
      useForValidation: true
      } ]
      }
      Currencycode,
      @Semantics: {
      amount.currencyCode: 'Currencycode'
      }
      Grossamount,
      @Semantics: {
      amount.currencyCode: 'Currencycode'
      }
      Netamount,
      @Semantics: {
      amount.currencyCode: 'Currencycode'
      }
      Taxamount,
      Lifecyclestatus,
      Lifecyclestatusdescription,
      Billingstatus,
      Billingstatusdescription,
      Deliverystatus,
      Deliverystatusdescription,
      Created,
      Changed,

      @Semantics: {
      systemDateTime.lastChangedAt: true
      }
      Locallastchangedat,
      @Semantics: {
      systemDateTime.createdAt: true
      }
      localCreatedat,
      @Semantics: {
      user.lastChangedBy : true
      }
      localchangedby,

      _item : redirected to composition child ZC_ORDER_ITEM,
      _customer

}
