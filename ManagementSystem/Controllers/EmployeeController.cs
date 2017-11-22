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

        [AllowAnonymous]
        public ActionResult SmartLogin(string returnUrl) {
            ViewBag.ReturnUrl = returnUrl;
            var employeeSession = (Employee)Session["employee"];

            if (employeeSession != null)
            {
                return RedirectToAction("WelcomePage", "Employee", new { employee = Session["employee"] });
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult SmartLogin(Employee employee)
        {
            var employeeLoggedIn = _userRepository.EmployeeLoggedInSmart(employee);
            if (employeeLoggedIn != null)
            {
                ViewBag.message = "loggedin";
                ViewBag.triedOnce = "yes";


                Session["employee"] = employeeLoggedIn;

                var employeeS = (Employee)Session["employee"];
                ViewBag.employeeTitle = employeeS.JobTitle;

                return RedirectToAction("WelcomePage", "Employee", new { username = employeeLoggedIn?.Username });
            }
            else
            {
                ViewBag.triedOnce = "yes";
                return View();
            }


        }







        public ActionResult login()
    {
        var employeeSession = (Employee)Session["employee"];

            if (employeeSession != null)
        {
            return RedirectToAction("WelcomePage", "Employee", new { employee = Session["employee"] });
        }
        else
        {
            return View();
        }
    } 
        public ActionResult logout()
        {
            Session["employee"] = null;
            return RedirectToAction("SmartLogin", "Employee");
            //return View(new { employee = Session["employee"] });
        }
        [HttpPost]
    public ActionResult login(Employee employee)
    {
        var employeeLoggedIn = _userRepository.EmployeeLoggedIn(employee);
        if (employeeLoggedIn != null)
        {
            ViewBag.message = "loggedin";
            ViewBag.triedOnce = "yes";
      

                Session["employee"] = employeeLoggedIn;

                var employeeS = (Employee)Session["employee"];
                ViewBag.employeeTitle = employeeS.JobTitle;

                return RedirectToAction("WelcomePage","Employee", new { username = employeeLoggedIn?.Username });
        }
        else
        {
            ViewBag.triedOnce = "yes";
            return View();
        }
    }
        public ActionResult WelcomePage(Employee employee)
        {
            var employeeS = (Employee)Session["employee"];
            ViewBag.employeeTitle = employeeS.JobTitle;

            //---graph current rating---
            var rating = employeeS.Rating / employeeS.NumberOfReviews;
            ViewBag.employeeRating = rating;

            //---graph review/progress----

            





            return View(employee);
        }
        public ActionResult MyProfile() {
            var employee = (Employee)Session["employee"];
            return View(employee);
        }


    }
}