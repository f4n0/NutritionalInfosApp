table 50000 "ADM Nutritional Information"
{
    DataClassification = CustomerContent;
    Caption = 'Nutritional Informations';

    fields
    {
        field(1; "Item No."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            TableRelation = item."No.";

            trigger OnValidate()
            var
                item: Record Item;
            begin
                item.Get(Rec."Item No.");
                Rec."Item description" := item.Description;
                //rec.Modify();
            end;
        }

        field(20; "Item description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Item description';
        }

        field(30; "Item Description 2"; Text[50])
        {
            //DataClassification = ;
            Caption = 'Item Description 2';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Description 2" where("No." = field("Item No.")));
            Editable = false;

        }

        field(40; "Nutritional Type"; Enum "ADM Nutritional Info Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Nutritional Information Type';
        }

        field(50; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }

    }

    keys
    {
        key(PK; "Item No.", "Nutritional Type")
        {
            Clustered = true;
        }
    }




}