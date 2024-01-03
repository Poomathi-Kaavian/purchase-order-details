namespace books;

using { cuid, managed } from '@sap/cds/common';

using {API_PURCHASEORDER_PROCESS_SRV as external} from '../srv/external/API_PURCHASEORDER_PROCESS_SRV';

entity Books : cuid, managed{
    Name : String;
    Author : String;
    purchaseOrder: Association to PurchaseOrder; 
    Vendor : Association to FreightVendor;
}

entity FreightVendor : cuid, managed {
    key ID: Integer;
    vendorName:String;
    pickUpLocation:String;
    destinationLocation:String;
    deliveryDays:Integer;
    contact:Int64;
    price:Int64;
}

entity PurchaseOrder as projection on external.A_PurchaseOrder {
   Supplier,
    key PurchaseOrder as ID,
    AddressCityName,
    AddressCountry,
};