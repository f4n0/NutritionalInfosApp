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
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
                }

                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
                }

            }
        }
        area(Factboxes)
        {

        }
    }
}