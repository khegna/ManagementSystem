using ManagementSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagementSystem.Business.Repository
{
    public class VacationRepository
    {
        private ManagementSystemEntities _dbContext;
        public VacationRepository()
        {
            _dbContext = new ManagementSystemEntities();
        }
        public List<Vacation> GetVacationByEmployeeId(int employeeId) {
            var vacations = _dbContext.Vacations.Where(x => x.EmployeeId == employeeId).ToList();
            return vacations;
        }
        public List<Vacation> GetVacationByDate(DateTime startDate) {
            var vacationsOnDate = _dbContext.Vacations.Where(x => x.StartDate == startDate).ToList();
            return vacationsOnDate;
        }
        public List<Vacation> GetVacationsOrderedByDate()
        {
            var vacations = _dbContext.Vacations.OrderBy(x => x.StartDate).ToList();
            return vacations;
        }
        public List<Vacation> GetVacationsOrderedByLastName()
        {
            var vacations = _dbContext.Vacations.OrderBy(x => x.Employee.LastName).ToList();
            return vacations;
        }
        public List<Vacation> GetVacationByStatus(string status)
        {
            var vacationsByStatus = _dbContext.Vacations.Where(x => x.AprovalStatus == status).ToList();
            return vacationsByStatus;
        }
    }
}
