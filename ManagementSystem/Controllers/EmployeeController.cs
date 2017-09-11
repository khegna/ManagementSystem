using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ManagementSystem.Business.Repository;
using ManagementSystem.Data;
using ManagementSystem.Business.EmployeeRepository;

namespace ManagementSystem.Controllers
{
    public class EmployeeController : Controller
    {
        private EmployeeRepository _userRepository;

        public EmployeeController()
        {
            _userRepository = new EmployeeRepository();
        }

    public ActionResult login()
    {
        var employeeSession = (Employee)Session["employee"];
        if (employeeSession != null)
        {
            return RedirectToAction("Welcomepage", "User", new { user = Session["user"] });
        }
        else
        {
            return View();
        }
    }
    [HttpPost]
    public ActionResult login(Employee employee)
    {
        var employeeLoggedIn = _userRepository.EmployeeLoggedIn(employee);
        if (employeeLoggedIn != null)
        {
            ViewBag.message = "loggedin";
            ViewBag.triedOnce = "yes";

            
            //Session["user"] = userLoggedIn;
            return RedirectToAction("Welcomepage", "User", new { username = employeeLoggedIn?.Username });
        }
        else
        {
            ViewBag.triedOnce = "yes";
            return View();
        }
    }



}
}