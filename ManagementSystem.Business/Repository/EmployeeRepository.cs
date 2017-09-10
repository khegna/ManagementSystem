using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ManagementSystem.Data;

namespace ManagementSystem.Business.EmployeeRepository
{
    public class EmployeeRepository
    {
        private ManagementSystemEntities _dbContext;
        // private Encryption.Encryptor _encrytor;
        public EmployeeRepository()
        {
            _dbContext = new ManagementSystemEntities();
            //     _encrytor = new Encryption.Encryptor();
        }

        public List<Employee> GetEmployees()
        {
            var employees = _dbContext.Employees.ToList();
            return employees;
        }
        public List<Employee> GetEmployeeOrderedByRating()
        {
            var employees = _dbContext.Employees.OrderBy(x => x.Rating).ToList();
            return employees;
        }
        public Employee GetEmployeeById(int employeeId)
        {
            var employee = _dbContext.Employees.Where(x => x.EmployeeId == employeeId).FirstOrDefault();
            return employee;
        }

        public List<Employee> GetEmployeesByManagerId(int managerId)
        {
            var employeesByManager = _dbContext.Employees.Where(x => x.ManagerId == managerId).ToList();
            // var employeesByManager = from e in _dbContext.Employees
            //                          where e.ManagerId = managerId
            //                          select e; 
            return employeesByManager;
        }

        public List<Employee> GetEmployeesByDepartment(int departmentId)
        {
            var employees = _dbContext.Employees.Where(x => x.DepartmentId == departmentId).ToList();
            return employees;
            // var employeesForDepartment = from d in _dbContext.Departments
            //                              join e in _dbContext.Employees on d.EmployeeId equals e.EmployeeId
            //                              where d.DepartmentId == departmentId
            //                              select e;
            // return employeesForDepartment.ToList();
        }

        public void CreateEmployee(Employee employee)
        {
            //user.UserPassword = _encrytor.Encrypt(user.UserPassword);
            _dbContext.Employees.Add(employee);
            _dbContext.SaveChanges();
        }

        public void DeleteEmployee(int? id)
        {
            if (id.HasValue)
            {
                var user = GetEmployeeById(id.Value);
                if (user != null)
                {
                    _dbContext.Employees.Remove(user);
                    _dbContext.SaveChanges();
                }
            }
        }

        public void EditUser(Employee employee)
        {
            var employeeEdit = GetEmployeeById(employee.EmployeeId);
            employeeEdit.Username = employee.Username;
            employeeEdit.LastName = employee.LastName;
            employeeEdit.FirstName = employee.FirstName;
            employeeEdit.Email = employee.Email;
            employeeEdit.JobTitle = employee.JobTitle;
            employeeEdit.ManagerId = employee.ManagerId;
            employeeEdit.Salary = employee.Salary;
            employeeEdit.VacationDays = employee.VacationDays;
            employeeEdit.EmployeePassword = employee.EmployeePassword;
            employeeEdit.Rating = employee.Rating;
            employeeEdit.SickDaysTotal = employee.SickDaysTotal;
            _dbContext.SaveChanges();
        }
    }
}

