pageextension 50106 "Sales Invoice Ext" extends "Sales Invoice"
{
    layout
    {

        addafter("Prices Including VAT")
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;
            }
        }
    }
}
