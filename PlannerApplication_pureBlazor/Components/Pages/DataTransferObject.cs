

namespace PlannerApplication_pureBlazor.Components.Pages
{
    public class DataTransferObject
    {
        private DateOnly _selectedDate = DateOnly.FromDateTime(DateTime.Now);
        public DateOnly SelectedDate { 
            get => _selectedDate;
            set 
            {
                _selectedDate = value;
                OnDateChange?.Invoke();
            } 
        }


        public event Action OnDateChange;



    }
}
