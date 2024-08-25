using Npgsql;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Diagnostics;
using System;

namespace PlannerCSharp.DataAccessLayer
{
    public sealed class Database
    {
        private static readonly Lazy<Database> Lazy = new(() => new Database());
		private static Process? process;
		public static Database Instance { get { return Lazy.Value; } }
        
        private readonly NpgsqlConnection _connection;

        private Database()
        {
            var cs = "Host=localhost;Username=postgres;Password=trust;Database=plannerapplication";

            _connection = new NpgsqlConnection(cs);
            try
            {
                _connection.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            Console.WriteLine("\n------------------------------------------------------");
            Console.WriteLine("Database Connection established!");
            Console.WriteLine("------------------------------------------------------\n");
        }

        ~Database()
        {
            _connection.Close();
        }

        public DatabaseResponse Query(DatabaseRequest request)
        {
            try
            {
                var cmd = new NpgsqlCommand(request.SqlQuery, _connection);

                // Add parameters to command
                foreach (var parameter in request.Data)
                {
                    var sqlParam = new NpgsqlParameter("@" + parameter.Key, parameter.Value);

                    cmd.Parameters.Add(sqlParam);
                }

                // Makes sure all our results are strings, no matter what data type they are in the database
                cmd.AllResultTypesAreUnknown = true;
                // Executes the query
                var reader = cmd.ExecuteReader();

                var response = new DatabaseResponse(reader);
                
                // Closes the reader to signal the database that the query is finished
                reader.Close();

                return response;
            }
            catch(Exception ex)
            {
                return new DatabaseResponse(ex.Message);
			}
		}

        public static bool StartDB()
		{
            bool ret = true;
            try
            {
				var processInfo = new ProcessStartInfo("C:\\Users\\Samuel\\Documents\\Personal_Projects\\Franziska\\PlannerApplication\\postgre\\start_db.cmd");
				processInfo.CreateNoWindow = true;
				processInfo.UseShellExecute = false;
				processInfo.RedirectStandardError = false;
				processInfo.RedirectStandardOutput = false;
				processInfo.RedirectStandardInput = true;

				process = Process.Start(processInfo);



				//process.WaitForExit();

				Console.WriteLine("ExitCode: {0}", process.ExitCode);
				process.Close();
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.Message);
				ret = false;
			}
			return ret;

		}
		private static void OnProcessExit(object sender, EventArgs e)
		{
			StopDB();
		}

		public static void StopDB()
		{
			try
			{
				if (process != null && !process.HasExited)
				{
					using (StreamWriter sw = process.StandardInput)
					{
						if (sw.BaseStream.CanWrite)
						{
							// Send the \q command to psql to gracefully exit the session
							sw.WriteLine("\\q");
						}
					}
					process.WaitForExit();
					Console.WriteLine("Database stopped successfully.");
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine("Error stopping the database: " + ex.Message);
			}
			finally
			{
				if (process != null)
				{
					process.Dispose();
				}
			}
		}
	}
}
