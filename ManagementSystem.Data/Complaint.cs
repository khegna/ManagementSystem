//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ManagementSystem.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Complaint
    {
        public int ComplaintId { get; set; }
        public string ComplaintDescription { get; set; }
        public Nullable<System.DateTime> DateFiled { get; set; }
        public Nullable<int> SeverityLevel { get; set; }
        public int EmployeeId { get; set; }
        public Nullable<bool> Resolved { get; set; }
    
        public virtual Employee Employee { get; set; }
    }
}