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

        public List<Employee> GetEmployeesByStatus()
        {
            var employees = _dbContext.Employees.ToList();
            return employees;
        }
    }
}
