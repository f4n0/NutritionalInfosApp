codeunit 50000 "ADM Event Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"ADM Nutritional Information", 'OnAfterInsertEvent', '', true, true)]
    local procedure ADMNutritionalInformation_OnAfterInsert(var Rec: Record "ADM Nutritional Information")
    var
        ADMNutritionalInformation: Record "ADM Nutritional Information";
    begin
        ADMNutritionalInformation.Reset();
        ADMNutritionalInformation.SetRange("Item No.", Rec."Item No.");
        if not ADMNutritionalInformation.CalcSums(Amount) then
            exit;

        if (ADMNutritionalInformation.Amount + Rec.Amount) > 2000 then
            Message('Careful total calories for item %1 is above 2000 (%2)', Rec."Item No.", ADMNutritionalInformation.Amount);
    end;

    [EventSubscriber(ObjectType::Table, Database::"ADM Nutritional Information", 'OnAfterModifyEvent', '', true, true)]
    local procedure ADMNutritionalInformation_OnAfterModifyEvent(var Rec: Record "ADM Nutritional Information"; var xRec: Record "ADM Nutritional Information")
    var
        ADMNutritionalInformation: Record "ADM Nutritional Information";
    begin
        ADMNutritionalInformation.Reset();
        ADMNutritionalInformation.SetRange("Item No.", Rec."Item No.");

        if not ADMNutritionalInformation.CalcSums(Amount) then
            exit;

        if (ADMNutritionalInformation.Amount + Rec.Amount - xRec.Amount) > 2000 then
            Message('Careful total calories for item %1 is above 2000 (%2)', Rec."Item No.", ADMNutritionalInformation.Amount);
    end;
}