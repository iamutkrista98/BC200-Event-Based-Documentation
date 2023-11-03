pageextension 50102 "General Journal Ext" extends "General Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;
            }
        }

    }
}
