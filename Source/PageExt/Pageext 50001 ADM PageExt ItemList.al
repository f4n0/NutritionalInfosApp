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
            action("Total Calories")
            {
                ApplicationArea = All;
                Caption = 'Total Calories';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item';
                /*
                Sommare le calorie di OGNI articolo e con una message mostrare il risultato
                */
                trigger OnAction()
                var
                    Item: Record Item;
                    TotalCalories: Decimal;
                begin
                    if Item.CalcSums("total calories") then begin
                        TotalCalories := Item."total calories";
                        Message('The sum of calories for every item is %1', TotalCalories);
                    end;

                end;
            }
        }
    }

    var
        myInt: Integer;
}