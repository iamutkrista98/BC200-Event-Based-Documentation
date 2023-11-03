tableextension 50107 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50100; custfield; Code[200])
        {
            Caption = 'custfield';
            DataClassification = ToBeClassified;
        }
    }
}
