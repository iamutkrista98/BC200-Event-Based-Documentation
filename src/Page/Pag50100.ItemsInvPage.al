page 50100 ItemsInvPage
{
    ApplicationArea = All;
    Caption = 'ItemsInvPage';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Documents;
    CardPageId = "ItemInvPageCard";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item.';
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. 2 field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies what you are selling.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
                }
            }


        }

    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Inventory, '>0');

    end;
}
