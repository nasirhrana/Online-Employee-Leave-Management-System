﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using EmployeeLeaveManagementApp.Gateway;
using EmployeeLeaveManagementApp.Models;
using EmployeeLeaveManagementApp.ViewModel;

namespace EmployeeLeaveManagementApp.Manager
{
    public class AdminManager
    {
        private AdminGateway adminGateway = new AdminGateway();

        public int AddEmployee(Employee employee)
        {
            int rowAffected = adminGateway.AddEmployee(employee);
            return rowAffected;

        }

        public int SetEmployeePassword(EmployeePassword employee)
        {
            return adminGateway.SetEmployeePassword(employee);
        }
        public int SetEmployeeUserType(EmployeeUserType employee)
        {
            return adminGateway.SetEmployeeUserType(employee);
        }

        public List<Employee> GetEmployeeById(int id)
        {
            return adminGateway.GetEmployeeById(id);
        }
        public List<UserType> GetUserType()
        {
            return adminGateway.GetUserType();
        }
        public List<LeaveType> GetLeaveTypes()
        {
            return adminGateway.GetLeaveTypes();
        }
        public List<Disignation> GetDesignationList()
        {
            return adminGateway.GetDesignationList();
        }

        public int AllocationLeave(AllocationEmployeeLeave allocation)
        {
            int rowAffected = adminGateway.AllocationLeave(allocation);
            return rowAffected;

        }

        public List<Employee> ListOfEmployee()
        {
            return adminGateway.GetAllEmployees();
        }

        public List<EmployeeLeaveInfo> GetEmployeeLeaveApplication()
        {
            return adminGateway.GetEmployeeLeaveApplication();
        }
        public List<EmployeeLeaveInfo> ShowAllLeaveStatus()
        {
            return adminGateway.ShowAllLeaveStatus();
        }

        public int Approve(int? id)
        {
            int rowAffected = adminGateway.Approve(id);
            return rowAffected;

        }
        public int Reject(int? id)
        {
            int rowAffected = adminGateway.Reject(id);
            return rowAffected;

        }
        public List<SubmitedApplicationInfo> GetUserEmail(int? id)
        {
            return adminGateway.GetUserEmail(id);
        }
        public List<SubmitedApplicationInfo> GetUserEmailAndName(int? id)
        {
            return adminGateway.GetUserEmailAndName(id);
        }
        public bool IsEmailExists(string email)
        {
            return adminGateway.IsEmailExist(email);
        }
        public bool IsLeaveTaken(EmployeeLeaveTaken leaveTaken)
        {
            return adminGateway.IsLeaveTaken(leaveTaken);
        }

        public bool IsLeaveAllocated(AllocationEmployeeLeave leaveTaken)
        {
            return adminGateway.IsLeaveAllocated(leaveTaken);
        }
        public bool IsPasswordSet(EmployeePassword employee)
        {
            return adminGateway.IsPasswordSet(employee);
        }
        public bool IsUserRoleSet(EmployeeUserType employee)
        {
            return adminGateway.IsUserRoleSet(employee);
        }
        public int SickLeaveLeft(int employeeId)
        {
            var totalSickLeave = adminGateway.AllLeaveInfo(employeeId);
            var sickLeaveTaken = adminGateway.GetTotalSickLeaveByEmployeeId(employeeId);
            int remaingSickLeave = 0;
            if (sickLeaveTaken.FirstOrDefault().TotalDay == 0)
            {
                remaingSickLeave = 0;
            }
            else
            {
                remaingSickLeave = sickLeaveTaken.FirstOrDefault().TotalDay;
            }
          
            return remaingSickLeave;
        }
        public int TotalSickLeave(int employeeId)
        {
            int totalSickLeave = 0;
            try
            {
                var totalSickLeaves = adminGateway.AllLeaveInfo(employeeId);

               totalSickLeave = totalSickLeaves.FirstOrDefault().NumberOfLeave;
            }
            catch (Exception)
            {
                totalSickLeave = 0;

            }

            return totalSickLeave;
        }
        public int CasualLeaveLeft(int employeeId)
        {
            var totalSickLeave = adminGateway.TotalCasualLeave(employeeId);
            var sickLeaveTaken = adminGateway.GetTotalCasualLeaveByEmployeeId(employeeId);
            int remaingSickLeave;
            if (sickLeaveTaken.FirstOrDefault().TotalDay == 0)
            {
                remaingSickLeave = 0;
            }
            else
            {
                 remaingSickLeave = sickLeaveTaken.FirstOrDefault().TotalDay;   
            }
           
            return remaingSickLeave;
        }
        public int TotalCasualLeave(int employeeId)
        {
            int totalSickLeave = 0;
            try
            {
                var totalSickLeaves = adminGateway.TotalCasualLeave(employeeId);

                totalSickLeave = totalSickLeaves.FirstOrDefault().NumberOfLeave;
            }
            catch (Exception)
            {
                totalSickLeave = 0;
            }

            return totalSickLeave;
        }

        public List<LoginInfo> GetUserRole(int id)
        {
            return adminGateway.GetUserRole(id);
        }

        public bool SendEmail(string toEmail, string subject, string emailBody)
        {

            try
            {
                string senderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
                string senderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(senderEmail, senderPassword);
                MailMessage mailMessage = new MailMessage(senderEmail, toEmail, subject, emailBody);

                mailMessage.IsBodyHtml = true;
                mailMessage.BodyEncoding = UTF8Encoding.UTF8;
                client.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}