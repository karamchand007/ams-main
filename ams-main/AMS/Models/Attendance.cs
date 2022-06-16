using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; //needed for Display annotation
using System.ComponentModel; //needed for DisplayName annotation
namespace AMS.Models
{
    public class Attendance
    {
        [DisplayName("Employee ID")]
        public string Employee_id { get; set; }
        
        [DisplayName("Employee Name")]
        public string empName { get; set; }

        [DisplayName("Date")]
        public string Date { get; set; }

        [DisplayName("Login Time")]
        public string loginTime { get; set; }

        [DisplayName("Logout Time")]
        public string logoutTime { get; set; }

        [DisplayName("Leave ID")]
        public string leaveId { get; set; }

        [DisplayName("Attendance Status")]
        public string AttendanceStatus { get; set; }
    }
}