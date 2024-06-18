query 70100 "Best Seller Items"
{
    QueryType = Normal;
    Caption = 'Best Seller items';
    OrderBy = descending(Sum_Invoiced_Quantity);
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(Value_Entry; "Value Entry")
        {
            DataItemTableFilter = "Item Ledger Entry Type" = filter("Item Ledger Entry Type"::Sale);

            filter(Posting_Date; "Posting Date")
            {
            }
            column(Item_No; "Item No.")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }

            column(Sum_Invoiced_Quantity; "Invoiced Quantity")
            {
                Method = Sum;
                ReverseSign = true;
            }

            dataitem(Item; Item)
            {
                DataItemLink = "No." = Value_Entry."Item No.";
                SqlJoinType = InnerJoin;

                column(Description; Description)
                {
                }
            }
        }
    }
}