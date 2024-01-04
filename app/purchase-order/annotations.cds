using PurchaseOrderService as service from '../../srv/service';

annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BookName}',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BookAuthor}',
            Value : Author,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PurchaseOrderId}',
            Value : purchaseOrder_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseOrder.Supplier,
            Label : 'Supplier',
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseOrder.AddressCityName,
            Label : '{i18n>SupplierCity}',
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseOrder.AddressCountry,
            Label : '{i18n>SupplierCountry}',
        },
    ]
);
annotate service.Books with {
    purchaseOrder @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'PurchaseOrder',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : purchaseOrder_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Supplier',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'AddressCityName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'AddressCountry',
            },
        ],
        Label : 'Purchase Order ID',
    }
};
annotate service.Books with {
    Vendor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'FreightVendor',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : Vendor_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'vendorName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'pickUpLocation',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'destinationLocation',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'deliveryDays',
            },
        ],
    }
};
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Author',
                Value : Author,
            },
            {
                $Type : 'UI.DataField',
                Label : 'purchaseOrder_ID',
                Value : purchaseOrder_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Vendor_ID',
                Value : Vendor_ID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>PurchaseOrderDetails}',
            ID : 'i18nPurchaseOrderDetails',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Purchase Order Info',
                    ID : 'PurchaseOrderInfo',
                    Target : '@UI.FieldGroup#PurchaseOrderInfo',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>FreightVendorDetails}',
            ID : 'FreightVendorDrtails',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Freight Vendor Info',
                    ID : 'FreightVendorInfo',
                    Target : '@UI.FieldGroup#FreightVendorInfo',
                },],
        },]
);
annotate service.Books with @(
    UI.FieldGroup #PurchaseOrderInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Name,
                Label : 'Name',
            },{
                $Type : 'UI.DataField',
                Value : Author,
                Label : 'Author',
            },{
                $Type : 'UI.DataField',
                Value : purchaseOrder_ID,
                Label : 'Purchase Order ID',
            },{
                $Type : 'UI.DataField',
                Value : purchaseOrder.Supplier,
                Label : 'Supplier',
            },{
                $Type : 'UI.DataField',
                Value : purchaseOrder.AddressCityName,
                Label : 'Supplier City',
            },{
                $Type : 'UI.DataField',
                Value : purchaseOrder.AddressCountry,
                Label : '{i18n>SupplierCountry}',
            },],
    }
);
annotate service.Books with {
    purchaseOrder @Common.ValueListWithFixedValues : false
};
annotate service.Books with @(
    UI.FieldGroup #FreightVendorInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Vendor_ID,
                Label : '{i18n>VendorId}',
            },
            {
                $Type : 'UI.DataField',
                Value : Vendor.vendorName,
                Label : '{i18n>VendorName}',
            },{
                $Type : 'UI.DataField',
                Value : Vendor.pickUpLocation,
                Label : '{i18n>PickUpLocation}',
            },{
                $Type : 'UI.DataField',
                Value : Vendor.destinationLocation,
                Label : '{i18n>DestinationLocation}',
            },{
                $Type : 'UI.DataField',
                Value : Vendor.deliveryDays,
                Label : '{i18n>DeliveryDays}',
            },{
                $Type : 'UI.DataField',
                Value : Vendor.price,
                Label : '{i18n>Price1}',
            },{
                $Type : 'UI.DataField',
                Value : Vendor.contact,
                Label : 'Vendor ID',
            },],
    }
);
annotate service.FreightVendor with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'FreightVendor',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'Freight Vendor',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : vendorName
)};
annotate service.FreightVendor with {
    vendorName @Common.FieldControl : #ReadOnly
};
annotate service.FreightVendor with {
    pickUpLocation @Common.FieldControl : #ReadOnly
};
annotate service.FreightVendor with {
    destinationLocation @Common.FieldControl : #ReadOnly
};
annotate service.FreightVendor with {
    deliveryDays @Common.FieldControl : #ReadOnly
};
annotate service.FreightVendor with {
    price @Common.FieldControl : #ReadOnly
};
annotate service.FreightVendor with {
    contact @Common.FieldControl : #ReadOnly
};
annotate service.PurchaseOrder with {
    ID @Common.Text : Supplier
};
