pageextension 50104 "G/L Entry Ext" extends "General Ledger Entries"
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
