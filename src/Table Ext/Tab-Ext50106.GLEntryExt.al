tableextension 50106 "G/L Entry Ext" extends "G/L Entry"
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
