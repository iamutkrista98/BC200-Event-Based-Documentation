tableextension 50112 "VAT Entry Ext" extends "VAT Entry"
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
