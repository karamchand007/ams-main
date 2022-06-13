using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; //needed for Display annotation
using System.ComponentModel; //needed for DisplayName annotation

namespace AMS.Models
{
    public class Login
    {
        [DisplayName("User ID")]
        public string userId { get; set; }

        [DisplayName("Password")]
        public string password { get; set; }

        [DisplayName("User Type ID")]
        public string userTypeId { get; set; }
    }

}