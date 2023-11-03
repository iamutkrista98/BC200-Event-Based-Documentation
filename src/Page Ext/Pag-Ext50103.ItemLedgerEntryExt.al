pageextension 50103 "Item Ledger Entry Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Completely Invoiced")
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;
            }

        }
    }
}
