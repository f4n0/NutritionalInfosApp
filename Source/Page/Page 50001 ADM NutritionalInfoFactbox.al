page 50001 "ADM Nutr. Info Factbox"
{
    Caption = 'Nutritional Info Factbox';
    PageType = ListPart;
    //UsageCategory = Lists;
    //ApplicationArea = All;
    SourceTable = "ADM Nutritional Information";
    //SourceTableView =

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Nutritional Type"; Rec."Nutritional Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Nutritional Information Type" field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Amount" field.';
                    //FieldPropertyName = FieldPropertyValue;
                }

            }
        }

    }


}