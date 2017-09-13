using ManagementSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagementSystem.Business.Repository
{
    public class ComplaintRepository
    {
        private ManagementSystemEntities _dbContext;
        public ComplaintRepository()
        {
            _dbContext = new ManagementSystemEntities();
        }
        public void CreateComplaint(Complaint complaint)
        {
            _dbContext.Complaints.Add(complaint);
            _dbContext.SaveChanges();
        }
        public List<Complaint> GetComplaints()
        {
            var complaints = _dbContext.Complaints.ToList();
            return complaints;
        }
        public List<Complaint> GetEmployeeOrderedSeverityLevel()
        {
            var complaints = _dbContext.Complaints.OrderBy(x => x.SeverityLevel).ToList();
            return complaints;
        }
        public List<Complaint> GetComplaintsById(int employeeId)
        {
            var complaints = _dbContext.Complaints.Where(x => x.EmployeeId == employeeId).ToList();
            return complaints;
        }
        public List<Complaint> GetComplaintsOrderedByDate()
        {
            var complaints = _dbContext.Complaints.OrderBy(x => x.DateFiled).ToList();
            return complaints;
        }
        public List<Complaint> GetComplaintsByResolved(bool resolutionVariable)
        {
            var complaints = _dbContext.Complaints.Where(x => x.Resolved == resolutionVariable).ToList(); ;
            return complaints;
        }

    }
}
