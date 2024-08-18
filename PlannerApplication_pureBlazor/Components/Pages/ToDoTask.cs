namespace PlannerApplication_pureBlazor.Components.Pages
{
    public class ToDoTask
    {
        public string Title { get; set; }
        public DateOnly BeginDate { get; set; }
        public DateOnly EndDate { get; set; }
        public int Id { get; set; }
        public string Repeat { get; set; }
        public string Username { get; set; }
        public string Type { get; set; }
    }
}
