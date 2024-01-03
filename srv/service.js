const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {

    const bupa = await cds.connect.to('API_PURCHASEORDER_PROCESS_SRV');

    this.on('READ', 'PurchaseOrder', async req => {
        return bupa.run(req.query);
    });

    // Books?$expand=purchaseOrder
    this.on("READ", 'Books', async (req, next) => {
        if (!req.query.SELECT.columns) return next();
        const expandIndex = req.query.SELECT.columns.findIndex(
            ({ expand, ref }) => expand && ref[0] === "purchaseOrder"
        );
        if (expandIndex < 0) return next();

        // Remove expand from query
        req.query.SELECT.columns.splice(expandIndex, 1);

        // Make sure purchaseOrder_ID will be returned
        if (!req.query.SELECT.columns.indexOf('*') >= 0 &&
            !req.query.SELECT.columns.find(
                column => column.ref && column.ref.find((ref) => ref == "purchaseOrder_ID"))
        ) {
            req.query.SELECT.columns.push({ ref: ["purchaseOrder_ID"] });
        }

        const books = await next();

        const asArray = x => Array.isArray(x) ? x : [ x ];

        // Request all associated purchaseOrders
        const purchaseOrderIds = asArray(books).map(risk => risk.purchaseOrder_ID);
        const purchaseOrders = await bupa.run(SELECT.from('PurchaseOrderService.PurchaseOrder').where({ ID: purchaseOrderIds }));

        // Convert in a map for easier lookup
        const purchaseOrdersMap = {};
        for (const purchaseOrder of purchaseOrders)
        purchaseOrdersMap[purchaseOrder.ID] = purchaseOrder;

        // Add purchaseOrder to result
        for (const note of asArray(books)) {
            note.purchaseOrder = purchaseOrdersMap[note.purchaseOrder_ID];
        }

        return books;
    });
});
