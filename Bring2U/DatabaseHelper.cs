using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace Bring2U
{
    public class DatabaseHelper
    {
        static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FoodDB;Integrated Security=SSPI;";
        

        public static DataTable sqlSearch(string sql, string tableName)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable(tableName);
            dt.Load(reader);
            conn.Close();

            return dt;
        }

        public static int sqlInsertUpdateDelete(string sql)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int rowsAffected = cmd.ExecuteNonQuery();
            conn.Close();
            return rowsAffected;
        }
    }
}