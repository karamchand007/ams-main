using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; //needed for Display annotation
using System.ComponentModel; //needed for DisplayName annotation

namespace AMS.Models
{
    public class Leave
    {
        //empId, leave_apply_date, leave_start_date, num_leave_days, leave_reason, leave_status_id
        [DisplayName("Leave ID")]
        public string leaveId { get; set; }
        [DisplayName("Employee ID")]
        public string empId { get; set; }
        [DisplayName("Employee Name")]
        public string empName { get; set; }
        [DisplayName("Leave Apply Date")]
        public string leave_apply_date { get; set; }
        [DisplayName("Leave Start Date")]
        public string leave_start_date { get; set; }
        [DisplayName("Number of Leave Days")]
        public string num_leave_days { get; set; }
        [DisplayName("Leave Reason")]
        public string leave_reason { get; set; }
        [DisplayName("Leave Status ID")]
        public string leave_status_id { get; set; }
        [DisplayName("Leave Status")]
        public string leave_status { get; set; }

    }
}