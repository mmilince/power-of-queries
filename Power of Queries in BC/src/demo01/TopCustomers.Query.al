query 70102 "Top Customers"
{
    Caption = 'Top Customers';
    OrderBy = Descending(Sum_Sales_Amount_Actual);
    TopNumberOfRows = 10;
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Entry Type" = FILTER(Sale), "Source Type" = FILTER(Customer);
            column(Source_No; "Source No.")
            {
            }
            column(Sum_Sales_Amount_Actual; "Sales Amount (Actual)")
            {
                Method = Sum;
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = Item_Ledger_Entry."Source No.";
                SqlJoinType = InnerJoin;

                column(Name; Name)
                {
                }
            }
        }
    }
}

