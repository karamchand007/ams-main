using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel; //needed for DisplayName annotation

namespace AMS.Models
{
    public class AttendanceReport
    {
        public string year { get; set; }
        public string month { get; set; }

        [DisplayName("Employee ID")]
        public string empId { get; set; }

        [DisplayName("Employee Name")]
        public string empName { get; set; }
        public string presentDays { get; set; }
        public string absentDays { get; set; }
        public string leaveDays { get; set; }
        public string holidays { get; set; }
    }
}