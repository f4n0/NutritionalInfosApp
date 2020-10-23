pageextension 50000 "ADM PageExt50000" extends "Item Card"
{

    layout
    {
        addlast(content)
        {
            group("ADM NutritionalInfos")
            {
                Caption = 'Nutritional Infos';
                field("ADM total calories"; Rec."ADM total calories")
                {
                    ApplicationArea = All;
                    Caption = 'Total calories';
                    ToolTip = 'Specifies the value of the "Total calories" field.';

                    trigger OnAssistEdit()
                    var
                        ADMNutritionalInformation: Record "ADM Nutritional Information";
                        tmpCal: Decimal;
                    begin
                        if not Confirm('Do you want to recalculate the total calories for the item %1 ?', true, Rec."No.") then
                            exit;

                        ADMNutritionalInformation.Reset();
                        ADMNutritionalInformation.SetRange("Item No.", Rec."No.");
                        if ADMNutritionalInformation.FindSet() then
                            repeat
                                tmpCal += ADMNutritionalInformation.Amount;
                            until ADMNutritionalInformation.Next() = 0;

                        Rec."ADM total calories" := (tmpCal * Rec."Net Weight") / 100;
                        Rec.Modify();
                    end;
                }
            }
        }

        addfirst(factboxes)
        {
            part("ADM Nutr. Info Factbox"; "ADM Nutr. Info Factbox")
            {
                Caption = 'Nutritional Infos';
                ApplicationArea = all;
                SubPageLink = "Item No." = field("No.");
            }
        }
    }


    actions
    {

        addlast(navigation)
        {

            group("ADM NutritionalInfo")
            {
                Caption = 'Item Nutritional Infos';
                action("ADM Nutritionals")
                {
                    ApplicationArea = All;
                    Caption = 'Show Nutritional Infos';
                    //Promoted = true;
                    //PromotedCategory = Process;
                    //PromotedIsBig = true;
                    Image = RelatedInformation;
                    ToolTip = 'Executes the "Show Nutritional Infos" action.';
                    trigger OnAction()
                    var
                        ADMNutritionalInfo: Record "ADM Nutritional Information";
                        locitem: Record item;
                        ADMNutritionalInfoPage: Page "ADM Nutritional Informations";
                        TotCal: Decimal;
                    begin

                        ADMNutritionalInfo.SetRange("Item No.", Rec."No.");
                        ADMNutritionalInfoPage.SetTableView(ADMNutritionalInfo);
                        ADMNutritionalInfoPage.RunModal();

                        TotCal := 0;
                        ADMNutritionalInfo.Reset();
                        ADMNutritionalInfo.SetRange("Item No.", Rec."No.");
                        if ADMNutritionalInfo.FindSet() then
                            repeat
                                TotCal += ADMNutritionalInfo.Amount;
                            until ADMNutritionalInfo.Next() = 0;

                        locitem.Get(Rec."No.");
                        locitem."ADM total calories" := TotCal;
                        locitem.Modify();


                    end;
                }

            }

        }
    }
}

