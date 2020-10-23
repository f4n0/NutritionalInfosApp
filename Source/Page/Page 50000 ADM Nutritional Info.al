page 50000 "ADM Nutritional Informations"
{
    Caption = 'Nutritional Infos';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ADM Nutritional Information";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                }
                field("Item description"; "Item description")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Item description 2"; "Item description 2")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    //FieldPropertyName = FieldPropertyValue;
                }

                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    //FieldPropertyName = FieldPropertyValue;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        tmpStyle := 'Favorable';
    end;

    var
        tmpStyle: Text;
}