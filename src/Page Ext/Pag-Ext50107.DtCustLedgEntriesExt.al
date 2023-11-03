pageextension 50107 "Dt Cust. Ledg. Entries Ext" extends "Detailed Cust. Ledg. Entries"
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
