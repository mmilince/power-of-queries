page 70100 "Best Seller Items"
{
    PageType = List;
    Caption = 'Best Seller Items';
    UsageCategory = None;
    SourceTable = "Best Seller Item Buffer";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No.';
                }
                field("Item Desciption"; Rec."Item Desciption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description';
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Group';
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Quantity';
                }
            }
        }
    }
}