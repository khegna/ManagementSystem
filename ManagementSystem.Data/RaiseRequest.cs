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
    
    public partial class RaiseRequest
    {
        public int RaiseRequestId { get; set; }
        public Nullable<System.DateTime> DateIssued { get; set; }
        public Nullable<int> RaiseAmount { get; set; }
        public string SendTo { get; set; }
        public string ApprovalStatus { get; set; }
        public int EmployeeId { get; set; }
    
        public virtual Employee Employee { get; set; }
    }
}
