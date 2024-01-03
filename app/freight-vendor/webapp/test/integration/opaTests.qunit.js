sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'freightvendor/test/integration/FirstJourney',
		'freightvendor/test/integration/pages/FreightVendorList',
		'freightvendor/test/integration/pages/FreightVendorObjectPage'
    ],
    function(JourneyRunner, opaJourney, FreightVendorList, FreightVendorObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('freightvendor') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFreightVendorList: FreightVendorList,
					onTheFreightVendorObjectPage: FreightVendorObjectPage
                }
            },
            opaJourney.run
        );
    }
);