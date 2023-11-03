pageextension 50110 "Bank Acc Ledg Entries Ext" extends "Bank Account Ledger Entries"
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
