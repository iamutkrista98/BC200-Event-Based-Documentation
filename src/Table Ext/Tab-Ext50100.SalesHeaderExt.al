tableextension 50100 "Sales Header Ext" extends "Sales Header"
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
