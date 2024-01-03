using FreightVendorService as service from '../../srv/service';

annotate service.FreightVendor with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'vendorName',
            Value : vendorName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pickUpLocation',
            Value : pickUpLocation,
        },
        {
            $Type : 'UI.DataField',
            Label : 'destinationLocation',
            Value : destinationLocation,
        },
        {
            $Type : 'UI.DataField',
            Label : 'deliveryDays',
            Value : deliveryDays,
        },
    ]
);
annotate service.FreightVendor with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vendorName',
                Value : vendorName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pickUpLocation',
                Value : pickUpLocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'destinationLocation',
                Value : destinationLocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliveryDays',
                Value : deliveryDays,
            },
            {
                $Type : 'UI.DataField',
                Label : 'contact',
                Value : contact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
