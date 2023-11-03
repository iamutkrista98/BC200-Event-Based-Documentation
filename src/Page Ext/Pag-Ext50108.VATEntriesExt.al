pageextension 50108 "VAT Entries Ext" extends "VAT Entries"
{
    layout
    {
        addafter(Amount)
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;
            }
        }
    }
}
