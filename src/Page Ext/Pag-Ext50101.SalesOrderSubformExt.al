pageextension 50101 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter("Bin Code")
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;
            }
        }
    }
}
