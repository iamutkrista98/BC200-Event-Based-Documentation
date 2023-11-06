page 50101 ItemInvPageCard
{
    Caption = 'ItemInvPageCard';
    PageType = Card;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item.';
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
    actions
    {
        area(Processing)
        {
            action("Get Entries")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Entries;
                trigger OnAction()
                var
                    ItemLedEnt: Record "Item Ledger Entry";

                begin
                    if not Confirm('Do you want to open the entries?', false) then
                        exit;
                    Page.RunModal(Page::"Item Ledger Entries", Rec);
                end;
            }
        }
    }
}
