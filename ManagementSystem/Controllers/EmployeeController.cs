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
    public class EmployeeController
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
            var employeeLoggedIn = EmployeeLoggedIn(employee);

        var userLoggedIn = db.Users.FirstOrDefault(x => x.UserName == user.UserName && x.UserPassword == userPasswordEncrypted);
        if (userLoggedIn != null)
        {
            ViewBag.message = "loggedin";
            ViewBag.triedOnce = "yes";

            // Session["username"] = user.UserName;
            Session["user"] = userLoggedIn;
            return RedirectToAction("Welcomepage", "User", new { username = userLoggedIn?.UserName });
        }
        else
        {
            ViewBag.triedOnce = "yes";
            return View();
        }
    }



}
}