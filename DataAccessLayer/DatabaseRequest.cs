namespace PlannerCSharp.DataAccessLayer
{
    public class DatabaseRequest
    {
        public string SqlQuery;
        public Dictionary<string, object> Data;

        public DatabaseRequest (string sqlQuery, Dictionary<string, object>? data = null)
        {
            data ??= new();

            SqlQuery = sqlQuery;
            Data = data;
        }

        public DatabaseResponse PerformQuery()
        {
            return Database.Instance.Query(this);
        }
    }
}
