using {books} from '../db/schema';

service PurchaseOrderService @(requires: 'authenticated-user') {
  entity Books @(restrict: [
    {
      grant: 'READ',
      to   : 'PurchaseOrderViewer'
    },
    {
      grant: [
        'READ',
        'WRITE',
        'UPDATE',
        'UPSERT',
        'DELETE'
      ], // Allowing CDS events by explicitly mentioning them
      to   : 'PurchaseOrderManager'
    }
  ])                   as projection on books.Books;

  annotate Books with @odata.draft.enabled;


  entity FreightVendor @(restrict: [
    {
      grant: 'READ',
      to   : 'PurchaseOrderViewer'
    },
    {
      grant: '*', // Allowing CDS events by explicitly mentioning them
      to   : 'PurchaseOrderManager'
    }
  ])  as projection on books.FreightVendor;

  @readonly
  entity PurchaseOrder  @(restrict: [
    {
      grant: 'READ',
      to   : ['PurchaseOrderViewer', 'PurchaseOrderManager']
    }
  ]) as projection on books.PurchaseOrder;

}

service FreightVendorService @(requires: 'authenticated-user') {
  entity FreightVendor @(restrict: [
    {
      grant: 'READ',
      to   : 'FreightVendorViewer'
    },
    {
      grant: '*', // Allowing CDS events by explicitly mentioning them
      to   : 'FreightVendorManager'
    }
  ])                   as projection on books.FreightVendor;

  annotate FreightVendor with @odata.draft.enabled;
}