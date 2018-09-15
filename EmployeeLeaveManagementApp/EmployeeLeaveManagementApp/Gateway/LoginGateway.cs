﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using EmployeeLeaveManagementApp.Models;
using EmployeeLeaveManagementApp.ViewModel;

namespace EmployeeLeaveManagementApp.Gateway
{
    public class LoginGateway
    {
        private SqlConnection con = new SqlConnection(
WebConfigurationManager.ConnectionStrings["LeaveManagementDb"].ConnectionString);

        public List<LoginInfo> SupAdminAdminLogin(LoginInfo employee)
        {

            employee.UserTypeId = 2;
            string query1 = @"SELECT s.Id, s.EmployeeName, s.Email, p.Password, e.UserTypeId
  FROM tb_Employee s
  INNER JOIN tb_EmployeePassword p on p.EmployeeId = s.Id
  INNER JOIN tb_EmployeeUserType e on e.EmployeeId = s.Id
  where Email = '" + employee.Email + "' and Password = '" + employee.Password + "' and UserTypeId = '" + employee.UserTypeId + "'";
            try
            {
                SqlCommand com = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader reader = com.ExecuteReader();
                List<LoginInfo> userInfo = new List<LoginInfo>();
                while (reader.Read())
                {
                    LoginInfo logins = new LoginInfo();
                    logins.Id = (int)reader["Id"];
                    logins.EmployeeName = reader["EmployeeName"].ToString();
                    logins.Email = reader["Email"].ToString();
                    logins.UserTypeId = (int)reader["UserTypeId"];
                    userInfo.Add(logins);

                }
                reader.Close();
                return userInfo;
            }
            catch (Exception exception)
            {
                throw new Exception("Unable to connect Server", exception);
            }
            finally
            {
                con.Close();
            }

        }

        public List<LoginInfo> AdminLogin(LoginInfo employee)
        {

            employee.UserTypeId = 1;
            string query1 = @"SELECT s.Id, s.EmployeeName, s.Email, p.Password, e.UserTypeId
  FROM tb_Employee s
  INNER JOIN tb_EmployeePassword p on p.EmployeeId = s.Id
  INNER JOIN tb_EmployeeUserType e on e.EmployeeId = s.Id
  where Email = '" + employee.Email + "' and Password = '" + employee.Password + "' and UserTypeId = '" + employee.UserTypeId + "'";
            try
            {
                SqlCommand com = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader reader = com.ExecuteReader();
                List<LoginInfo> userInfo = new List<LoginInfo>();
                while (reader.Read())
                {
                    LoginInfo logins = new LoginInfo();
                    logins.Id = (int)reader["Id"];
                    logins.EmployeeName = reader["EmployeeName"].ToString();
                    logins.Email = reader["Email"].ToString();
                    logins.UserTypeId = (int)reader["UserTypeId"];
                    userInfo.Add(logins);

                }
                reader.Close();
                con.Close();
                return userInfo;
            }
            catch (Exception exception)
            {
                throw new Exception("Unable to connect Server", exception);
            }
            finally
            {
                con.Close();
            }

        }
        public List<LoginInfo> UserLogin(LoginInfo employee)
        {

            employee.UserTypeId = 3;
            string query1 = @"SELECT s.Id, s.EmployeeName, s.Email, p.Password, e.UserTypeId
  FROM tb_Employee s
  INNER JOIN tb_EmployeePassword p on p.EmployeeId = s.Id
  INNER JOIN tb_EmployeeUserType e on e.EmployeeId = s.Id
  where Email = '" + employee.Email + "' and Password = '" + employee.Password + "' and UserTypeId = '" + employee.UserTypeId + "'";
            try
            {
                SqlCommand com = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader reader = com.ExecuteReader();
                List<LoginInfo> userInfo = new List<LoginInfo>();
                while (reader.Read())
                {
                    LoginInfo logins = new LoginInfo();
                    logins.Id = (int)reader["Id"];
                    logins.EmployeeName = reader["EmployeeName"].ToString();
                    logins.Email = reader["Email"].ToString();
                    logins.UserTypeId = (int)reader["UserTypeId"];
                    userInfo.Add(logins);

                }
                reader.Close();
                con.Close();
                return userInfo;
            }
            catch (Exception exception)
            {
                throw new Exception("Unable to connect Server", exception);
            }
            finally
            {
                con.Close();
            }

        }
    }
}