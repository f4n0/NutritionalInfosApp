page 50002 "ADM Nutritional Info. Summary"
{
    Caption = 'Nutritional Infos';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ADM Nutritional Information";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Nutritional Type"; Rec."Nutritional Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nutritional Information Type field';
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field';
                }

            }
        }
        area(Factboxes)
        {

        }
    }
}