﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeLeaveManagementApp.ViewModel
{
    public class SubmitedApplicationInfo
    {
        public int Id { get; set; }
        public string EmployeeName { get; set; }
        public string Email { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string EntryDate { get; set; }
        public string TotalDay { get; set; }
    }
}