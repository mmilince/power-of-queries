table 70100 "Best Seller Item Buffer"
{
    DataClassification = CustomerContent;
    TableType = Temporary;
    Caption = 'Best Seller Item Buffer';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; "Item Desciption"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(3; "Customer Group"; Code[20])
        {
            Caption = 'Customer Group';
        }
        field(4; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
        }
    }

    keys
    {
        key(Key1; "Item No.", "Customer Group")
        {
            Clustered = true;
        }
    }
}