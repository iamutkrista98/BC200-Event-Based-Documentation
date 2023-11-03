pageextension 50111 "Purchase Header Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Buy-from")
        {
            field(custfield; Rec.custfield)
            {
                ApplicationArea = All;

            }
        }
    }
}
