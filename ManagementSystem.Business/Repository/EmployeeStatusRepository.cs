using ManagementSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagementSystem.Business.Repository
{
    public class EmployeeStatusRepository
    {
        private ManagementSystemEntities _dbContext;
        public EmployeeStatusRepository()
        {
            _dbContext = new ManagementSystemEntities();
        }

        public List<Employee> GetEmployeesByStatus(string currentStatus)
        {
            var employees = _dbContext.Employees.Where(x => x.EmployeeStatu.CurrentStatus == currentStatus).ToList();
            return employees;
        }
    }
}
