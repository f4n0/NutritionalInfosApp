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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the "Item No." field.';
                }
                field("Item description"; Rec."Item description")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the "Item description" field.';
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Item description 2"; Rec."Item description 2")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the "Item Description 2" field.';
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Nutritional Type"; Rec."Nutritional Type")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the "Nutritional Information Type" field.';
                    //FieldPropertyName = FieldPropertyValue;
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the "Amount" field.';
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        tmpStyle := 'Favorable';
    end;

    var
        tmpStyle: Text;
}
