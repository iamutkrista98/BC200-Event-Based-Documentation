tableextension 50111 "Sales Invoice Line Ext" extends "Sales Invoice Line"
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
