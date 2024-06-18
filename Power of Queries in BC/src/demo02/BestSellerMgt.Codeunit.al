codeunit 70100 "Best Seller Mgt."
{
    procedure RunFilteredQuery(ItemNoFilter: Text)
    var
        BestSellerItemBuffer: Record "Best Seller Item Buffer";
    begin
        PopulateBufferData(ItemNoFilter, BestSellerItemBuffer);

        Page.Run(Page::"Best Seller Items", BestSellerItemBuffer);
    end;

    local procedure PopulateBufferData(ItemNoFilter: Text; var BestSellerItemBuffer: Record "Best Seller Item Buffer")
    var
        BestSellerItems: Query "Best Seller Items";
    begin
        BestSellerItems.SetFilter(Item_No, ItemNoFilter);
        BestSellerItems.Open();

        while BestSellerItems.Read() do begin
            BestSellerItemBuffer.Init();
            BestSellerItemBuffer."Item No." := BestSellerItems.Item_No;
            BestSellerItemBuffer."Customer Group" := BestSellerItems.Global_Dimension_2_Code;
            BestSellerItemBuffer."Item Desciption" := BestSellerItems.Description;
            BestSellerItemBuffer."Total Quantity" := BestSellerItems.Sum_Invoiced_Quantity;
            BestSellerItemBuffer.Insert(true);
        end;
        BestSellerItems.Close();
    end;
}