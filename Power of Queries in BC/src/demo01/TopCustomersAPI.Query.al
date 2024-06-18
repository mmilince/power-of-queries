query 70101 "Top Customers API"
{
    QueryType = API;
    Caption = 'Top customers';
    OrderBy = Ascending(Sum_Sales_Amount_Actual);
    APIGroup = 'conference';
    APIPublisher = 'demo';
    APIVersion = 'v1.0';
    EntityName = 'topCustomer';
    EntitySetName = 'topCustomers';

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