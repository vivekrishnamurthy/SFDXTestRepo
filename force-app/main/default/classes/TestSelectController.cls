public class TestSelectController {
     public List<SelectOption> getyears() 
     {
        List<SelectOption> options = new List<SelectOption>();
        for (Integer i = System.Today().year() - 3; i < System.Today().year() + 3; i++) {

            options.add(new SelectOption(String.valueOf(i), String.valueOf(i)));

        }

        return options;

    }

    public String selectedYear {get; set;}

    public TestSelectController() 
    {
        selectedYear = String.valueOf(System.Today().year());
    }

}