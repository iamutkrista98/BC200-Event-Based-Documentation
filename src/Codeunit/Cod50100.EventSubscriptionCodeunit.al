codeunit 50100 "Event Subscription Codeunit"
{
    //from salesheader to general journal line
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        case GenJournalLine."Account Type" of
            GenJournalLine."Account Type"::Customer:
                GenJournalLine.custfield := SalesHeader.custfield + ' From GJL Account Type Customer';
            GenJournalLine."Account Type"::"G/L Account":
                GenJournalLine.custfield := SalesHeader.custfield + ' From GJL Account Type GL';
            GenJournalLine."Account Type"::"Bank Account":
                GenJournalLine.custfield := SalesHeader.custfield + ' From GJL Account Type Bank Account';
            GenJournalLine."Account Type"::Employee:
                GenJournalLine.custfield := SalesHeader.custfield + ' From GJL Account Type Employee';
            GenJournalLine."Account Type"::"Fixed Asset":
                GenJournalLine.custfield := SalesHeader.custfield + ' From GJL Account Type Fixed Asset';
        end;


    end;

    //from general journal line to g/l entry
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        case GenJournalLine."Account Type" of
            GenJournalLine."Account Type"::Customer:
                GLEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type Customer';
            GenJournalLine."Account Type"::Vendor:
                GLEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type Vendor';
            GenJournalLine."Account Type"::"G/L Account":
                GLEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type GL';
            GenJournalLine."Account Type"::Employee:
                GLEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type Employee';
            GenJournalLine."Account Type"::"Fixed Asset":
                GLEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type Fixed Asset';

        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine.custfield := SalesLine.custfield + ' From Sales Line';

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        ItemLedgerEntry.custfield := ItemJournalLine.custfield + ' From Item Journal Line';
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertValueEntry', '', false, false)]
    local procedure OnBeforeInsertValueEntry(ItemJournalLine: Record "Item Journal Line"; var ValueEntry: Record "Value Entry")
    begin
        case ItemJournalLine."Source Type" of
            ItemJournalLine."Source Type"::Customer:
                ValueEntry.custfield := ItemJournalLine.custfield + ' From Item Journal Line Source Customer';
            ItemJournalLine."Source Type"::Item:
                ValueEntry.custfield := ItemJournalLine.custfield + ' From Item Journal Line Source Item';
            ItemJournalLine."Source Type"::Vendor:
                ValueEntry.custfield := ItemJournalLine.custfield + ' From Item Journal Line Source Vendor';
            ItemJournalLine."Source Type"::" ":
                ValueEntry.custfield := ItemJournalLine.custfield + ' From Item Journal Line Source Blank';

        end;
    end;



    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        case GenJournalLine."Account Type" of
            GenJournalLine."Account Type"::Customer:
                CustLedgerEntry.custfield := GenJournalLine.custfield + ' From Source Customer';
        // GenJournalLine."Account Type"::"G/L Account":
        //     CustLedgerEntry.custfield := GenJournalLine.custfield + ' From Source GL';
        // GenJournalLine."Account Type"::
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        case GenJournalLine."Account Type" of
            GenJournalLine."Account Type"::Vendor:
                VendorLedgerEntry.custfield := GenJournalLine.custfield + 'From GJ Account Type Vendor ';
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyFromGenJnlLine(GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    begin
        case GenJournalLine."Account Type" of
            GenJournalLine."Account Type"::"Bank Account":
                BankAccountLedgerEntry.custfield := GenJournalLine.custfield + ' From GJ Account Type Bank';
        end;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitBankAccLedgEntry', '', false, false)]
    // local procedure OnAfterInitBankAccLedgEntry(GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    // begin

    // end;

    //from general journal line to detailed cust ledger entry

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldCustLedgEntry', '', false, false)]
    local procedure OnBeforeInsertDtldCustLedgEntry(var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        DtldCustLedgEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type Customer';

    end;

    //from sales invoice line to sales line

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
    local procedure OnAfterPostSalesLine(var SalesLine: Record "Sales Line"; var SalesInvLine: Record "Sales Invoice Line")
    begin
        SalesLine.custfield := SalesInvLine.custfield + ' From Sales Invoice Line';
    end;

    //from General Journal Line to VAT Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertVATEntry', '', false, false)]
    local procedure OnAfterInsertVATEntry(var VATEntry: Record "VAT Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        // GenJnlLine.TestField("VAT Amount");
        VATEntry.custfield := GenJournalLine.custfield + ' From GJL';
    end;

    //from general journal line to detailed vendor ledger entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldVendLedgEntry', '', false, false)]
    local procedure OnBeforeInsertDtldVendLedgEntry(GenJournalLine: Record "Gen. Journal Line"; var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry")
    begin
        DtldVendLedgEntry.custfield := GenJournalLine.custfield + ' From GJL Account Type Vendor';

    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromPurchHeader(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.custfield := PurchaseHeader.custfield + ' From Purchase Header';

    end;







}
