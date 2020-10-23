pageextension 50001 "ADM PageExt50001" extends "Item List" //31
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here


        addlast(processing)
        {
            action("ADM Total Calories")
            {
                ApplicationArea = All;
                Caption = 'Total Calories';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item.';
                trigger OnAction()
                var
                    Item: Record Item;
                    TotalCalories: Decimal;
                begin
                    if Item.CalcSums("ADM total calories") then begin
                        TotalCalories := Item."ADM total calories";
                        Message('The sum of calories for every item is %1', TotalCalories);
                    end;

                end;
            }

            action("ADM Summary Values")
            {
                ApplicationArea = All;
                Caption = 'Summary Values (ADM)';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SuggestWorkMachCost;
                ToolTip = 'Executes the "Summary Values (ADM)" action.';


                trigger OnAction()
                var
                    TempADMNutritionalInformation: Record "ADM Nutritional Information" temporary;
                    ADMNutritionalInformation: Record "ADM Nutritional Information";
                    tmpAmount: Decimal;
                begin
                    ADMNutritionalInformation.Reset();
                    ADMNutritionalInformation.SetRange("Nutritional Type", ADMNutritionalInformation."Nutritional Type"::Sugars);
                    if ADMNutritionalInformation.CalcSums(Amount) then begin
                        tmpAmount := ADMNutritionalInformation.Amount;

                        TempADMNutritionalInformation.Init();
                        TempADMNutritionalInformation."Nutritional Type" := TempADMNutritionalInformation."Nutritional Type"::Sugars;
                        TempADMNutritionalInformation."Amount" := tmpAmount;
                        TempADMNutritionalInformation.Insert();
                    end;

                    ADMNutritionalInformation.Reset();
                    ADMNutritionalInformation.SetRange("Nutritional Type", ADMNutritionalInformation."Nutritional Type"::Carbohydrates);
                    if ADMNutritionalInformation.CalcSums(Amount) then begin
                        tmpAmount := ADMNutritionalInformation.Amount;

                        TempADMNutritionalInformation.Init();
                        TempADMNutritionalInformation."Nutritional Type" := TempADMNutritionalInformation."Nutritional Type"::Carbohydrates;
                        TempADMNutritionalInformation."Amount" := tmpAmount;
                        TempADMNutritionalInformation.Insert();
                    end;

                    ADMNutritionalInformation.Reset();
                    ADMNutritionalInformation.SetRange("Nutritional Type", ADMNutritionalInformation."Nutritional Type"::Fats);
                    if ADMNutritionalInformation.CalcSums(Amount) then begin
                        tmpAmount := ADMNutritionalInformation.Amount;

                        TempADMNutritionalInformation.Init();
                        TempADMNutritionalInformation."Nutritional Type" := TempADMNutritionalInformation."Nutritional Type"::Fats;
                        TempADMNutritionalInformation."Amount" := tmpAmount;
                        TempADMNutritionalInformation.Insert();
                    end;


                    ADMNutritionalInformation.Reset();
                    ADMNutritionalInformation.SetRange("Nutritional Type", ADMNutritionalInformation."Nutritional Type"::Proteins);
                    if ADMNutritionalInformation.CalcSums(Amount) then begin
                        tmpAmount := ADMNutritionalInformation.Amount;

                        TempADMNutritionalInformation.Init();
                        TempADMNutritionalInformation."Nutritional Type" := TempADMNutritionalInformation."Nutritional Type"::Proteins;
                        TempADMNutritionalInformation."Amount" := tmpAmount;
                        TempADMNutritionalInformation.Insert();
                    end;

                    //Page.RunModal(page::"ADM Nutritional Informations", TempADMNutritionalInformation);
                    Page.RunModal(page::"ADM Nutritional Info. Summary", TempADMNutritionalInformation);
                    MyProcedure();
                end;
            }
        }
    }

    local procedure MyProcedure()
    var
        TempADMNutritionalInformation: Record "ADM Nutritional Information" temporary;
        ADMNutritionalInformation: Record "ADM Nutritional Information";
        tmpAmount: Decimal;
        ADMNutritionalInfoType: Enum "ADM Nutritional Info Type";
        CurrentEnum: Integer;
    begin
        foreach CurrentEnum in ADMNutritionalInfoType.Ordinals() do begin
            ADMNutritionalInformation.Reset();
            ADMNutritionalInformation.SetRange("Nutritional Type", "ADM Nutritional Info Type".FromInteger(CurrentEnum));
            if ADMNutritionalInformation.CalcSums(Amount) then begin
                tmpAmount := ADMNutritionalInformation.Amount;

                TempADMNutritionalInformation.Init();
                TempADMNutritionalInformation."Nutritional Type" := "ADM Nutritional Info Type".FromInteger(CurrentEnum);
                TempADMNutritionalInformation."Amount" := tmpAmount;
                TempADMNutritionalInformation.Insert();
            end;
        end;

        Page.RunModal(page::"ADM Nutritional Info. Summary", TempADMNutritionalInformation);
    end;

}