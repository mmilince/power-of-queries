report 70101 "Purchase Documents"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Excel;
    Caption = 'Purchase Documents';

    dataset
    {

        dataitem(Integer; Integer)
        {
            column(DocumentType; PurchaseDocument.Document_Type_)
            {

            }
            column(DocumentNo; PurchaseDocument.Document_No_)
            {

            }
            column(DocumentKey; StrSubstNo(DocumentKeyLbl, PurchaseDocument.Document_Type_, PurchaseDocument.Document_No_))
            {

            }
            column(BuyFromVendorNo; PurchaseDocument.Buy_from_Vendor_No_)
            {

            }
            column(BuyFromVendorName; PurchaseDocument.Buy_from_Vendor_Name)
            {

            }
            column(ItemNo; PurchaseDocument.Item_No_)
            {

            }
            column(ItemDescription; PurchaseDocument.Item_Description)
            {

            }
            column(Location_Code; PurchaseDocument.Location_Code)
            {

            }
            column(Quantity; PurchaseDocument.Quantity)
            {

            }
            column(QtyToReceive; PurchaseDocument.Qty__to_Receive)
            {

            }
            column(QuantityReceived; PurchaseDocument.Quantity_Received)
            {

            }
            column(Amount; PurchaseDocument.Amount)
            {

            }

            trigger OnPreDataItem()
            begin
                PurchaseDocument.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not PurchaseDocument.Read() then
                    CurrReport.Break();
            end;
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }

    rendering
    {
        layout(Excel)
        {
            Type = Excel;
            LayoutFile = './src/demo03/Layout/PurchaseDocuments.xlsx';
        }
    }

    var
        PurchaseDocument: Query "Purchase Document";
        DocumentKeyLbl: Label '%1 - %2', Locked = true;
}