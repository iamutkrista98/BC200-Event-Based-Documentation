tableextension 50110 "Detailed Cust. Ledg. Entry Ext" extends "Detailed Cust. Ledg. Entry"
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
