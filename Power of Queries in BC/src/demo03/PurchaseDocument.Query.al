query 70103 "Purchase Document"
{
    QueryType = Normal;
    Caption = 'Purchase Document';

    elements
    {
        dataitem(Purchase_Header; "Purchase Header")
        {
            column(Document_Type_; "Document Type")
            {

            }
            column(Document_No_; "No.")
            {

            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            dataitem(Purchase_Line; "Purchase Line")
            {
                DataItemLink = "Document Type" = Purchase_Header."Document Type",
                               "Document No." = Purchase_Header."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = Type = filter(Item);

                column(Item_No_; "No.")
                {

                }
                column(Item_Description; Description)
                {

                }
                column(Location_Code; "Location Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Qty__to_Receive; "Qty. to Receive")
                {

                }
                column(Quantity_Received; "Quantity Received")
                {

                }
                column(Amount; Amount)
                {

                }
            }
        }
    }
}