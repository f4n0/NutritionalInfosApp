codeunit 50001 "ADM Tests"
{
    Subtype = Test;

    var
        Item: Record Item;

    [Test]
    [HandlerFunctions('NutritionalInformationsModalPageHandler')]
    procedure TestNutritionalInfoPage()
    var
        LibraryInventory: Codeunit "Library - Inventory";
        ItemList: TestPage "Item List";
        ItemCard: TestPage "Item Card";
    begin
        LibraryInventory.CreateItem(Item);

        ItemList.OpenView();
        ItemList.GoToRecord(Item);

        ItemCard.Trap();
        ItemList.Edit().Invoke();

        ItemCard."ADM Nutritionals".Invoke();
    end;


    [ModalPageHandler]
    procedure NutritionalInformationsModalPageHandler(var ADMNutritionalInformations: TestPage "ADM Nutritional Informations")
    var
        ADMNutritionalInfoType: Enum "ADM Nutritional Info Type";
    begin
        //ADMNutritionalInformations.Close();
        ADMNutritionalInformations."Item No.".SetValue(Item."No.");
        ADMNutritionalInformations."Nutritional Type".SetValue(ADMNutritionalInfoType::Fats);
        ADMNutritionalInformations.Amount.SetValue(10.5);
    end;
}