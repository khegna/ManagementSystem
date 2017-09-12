using ManagementSystem.Business.EmployeeRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ManagementSystem.Controllers
{
    public class ManagerController : Controller
    {
        private EmployeeRepository _userRepository;

        public ManagerController()
        {
            _userRepository = new EmployeeRepository();
        }
        // GET: Manager
        public ActionResult Index(String searchTerm = null)
        {
            var employees = _userRepository.GetEmployees();
          
            return View(employees);
        }
    }
}