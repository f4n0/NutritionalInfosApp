tableextension 50000 "ADM TableExt50000" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50000; "ADM total calories"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Calories';

        }

    }


}