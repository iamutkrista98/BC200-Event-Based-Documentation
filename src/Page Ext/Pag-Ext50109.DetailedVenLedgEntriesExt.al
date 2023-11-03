pageextension 50109 "Detailed Ven Ledg. Entries Ext" extends "Detailed Vendor Ledg. Entries"
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
