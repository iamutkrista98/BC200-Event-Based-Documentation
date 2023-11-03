pageextension 50105 "Vendor Ledger Entries Ext" extends "Vendor Ledger Entries"
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
