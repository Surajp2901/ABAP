@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@Search.searchable : true
@ObjectModel.usageType:{
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED
}
define view entity ZR_CUSTOMER_HEAD as select from zcustomer_head
{
@EndUserText.label: 'Customer ID'
@Search.defaultSearchElement: true
key customerid as Customerid,
@EndUserText.label: 'Customer Name'
@Search.defaultSearchElement: true
customername as Customername
}
