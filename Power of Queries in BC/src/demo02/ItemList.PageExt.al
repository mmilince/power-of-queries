pageextension 70100 "Item List Ext." extends "Item List"
{

    actions
    {
        addbefore("Inventory - List")
        {
            action("Top customers")
            {
                ApplicationArea = All;
                Caption = 'Top customers';
                RunObject = query "Top Customers API";
                Tooltip = 'Open the Top Customers API query.';
                Image = CustomerRating;
            }

            action("Best Seller items")
            {
                ApplicationArea = All;
                Caption = 'Best Seller items';
                RunObject = query "Best Seller Items";
                Tooltip = 'Open the Best Seller items query.';
                Image = Statistics;
            }

            action("Best Seller items filtered")
            {
                ApplicationArea = All;
                Caption = 'Best Seller items filtered';
                Tooltip = 'Open the Best Seller items query for selected items.';
                Image = Statistics;

                trigger OnAction()
                var
                    BestSellerMgt: Codeunit "Best Seller Mgt.";
                    ItemFilter: Text;
                begin
                    ItemFilter := GetSelectionFilter();

                    BestSellerMgt.RunFilteredQuery(ItemFilter);
                end;
            }
        }
    }

    local procedure GetSelectionFilter(): Text
    var
        Item: Record Item;
        RecRef: RecordRef;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Item);
        RecRef.GetTable(Item);

        exit(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;
}