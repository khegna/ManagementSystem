using ManagementSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagementSystem.Business.Repository
{
    public class SickLeaveRepository
    {
        private ManagementSystemEntities _dbContext;
        public SickLeaveRepository()
        {
            _dbContext = new ManagementSystemEntities();
        }
        public List<SickLeave> GetSickLeaveByEmployeeId(int employeeId)
        {
            var sickLeaves = _dbContext.SickLeaves.Where(x => x.EmployeeId == employeeId).ToList();
            return sickLeaves;
        }
        public List<SickLeave> GetSickLeavenByDate(DateTime startDate)
        {
            var sickLeaveOnDate = _dbContext.SickLeaves.Where(x => x.StartDate == startDate).ToList();
            return sickLeaveOnDate;
        }
        public List<SickLeave> GetSickLeaveOrderedByDate()
        {
            var sickLeaves = _dbContext.SickLeaves.OrderBy(x => x.StartDate).ToList();
            return sickLeaves;
        }
        public List<SickLeave> GetSickLeaveOrderedByLastName()
        {
            var sickLeaves = _dbContext.SickLeaves.OrderBy(x => x.Employee.LastName).ToList();
            return sickLeaves;
        }
        public List<SickLeave> GetSickLeaveByStatus(string status)
        {
            var sickLeaveByStatus = _dbContext.SickLeaves.Where(x => x.ApprovalStatus == status).ToList();
            return sickLeaveByStatus;
        }
    }
}
