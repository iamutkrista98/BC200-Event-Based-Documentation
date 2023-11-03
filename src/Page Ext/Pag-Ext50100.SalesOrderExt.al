pageextension 50100 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter("No.")
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;
            }
        }
    }
}
