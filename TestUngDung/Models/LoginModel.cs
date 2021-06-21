﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestUngDung.Models
{
    public class LoginModel
    {
        [Required]
        public string UserID { get; set; }


        public string UserName { get; set; }


        public string Password { get; set; }


        public string Status { get; set; }
    }
}