using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ManagementSystem.Data;
using ManagementSystem.Business.EmployeeRepository;

namespace ManagementSystem.Controllers
{
    public class ManagerController : Controller
    {
        private EmployeeRepository _userRepository;

        public ManagerController()
        {
            _userRepository = new EmployeeRepository();
        }
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: Manager
        public ActionResult Index(string searchBy, string search)
        {
            var session = (Employee)Session["employee"];
            if (session.JobTitle == "Manager")
            {
                var employeeByManager = (db.Employees.Where(x => x.ManagerId == session.EmployeeId).ToList());
                if (searchBy == "Name")
                {
                    return View(employeeByManager.Where(x => x.LastName.StartsWith(search)).ToList());
                }
                if (searchBy == "Username")
                {
                    return View(employeeByManager.Where(x => x.Username.StartsWith(search)).ToList());
                }
                if (searchBy == "Sickdays")
                {
                    return View(employeeByManager.Where(x => (x.SickDaysTotal).ToString() == search).ToList());
                }
                if (searchBy == "DepartmentId")
                {
                    return View(employeeByManager.Where(x => (x.DepartmentId).ToString() == search).ToList());
                }
                if (searchBy == "JobTitle")
                {
                    return View(employeeByManager.Where(x => x.JobTitle.StartsWith(search)).ToList());
                }
                
                var employees = employeeByManager.OrderByDescending(x => x.Standing).ToList();
                return View(employees.ToList());
            }
            if (((Employee)Session["employee"]).JobTitle == "Human Resources")
            {
                if (searchBy == "Name")
                {
                    return View(db.Employees.Where(x => x.LastName.StartsWith(search)).ToList());
                }
                if (searchBy == "Username")
                {
                    return View(db.Employees.Where(x => x.Username.StartsWith(search)).ToList());
                }
                if (searchBy == "Sickdays")
                {
                    return View(db.Employees.Where(x => (x.SickDaysTotal).ToString() == search).ToList());
                }
                if (searchBy == "DepartmentId")
                {
                    return View(db.Employees.Where(x => (x.DepartmentId).ToString() == search).ToList());
                }
                if (searchBy == "JobTitle")
                {
                    return View(db.Employees.Where(x => x.JobTitle.StartsWith(search)).ToList());
                }
            }

            var employee = db.Employees.OrderByDescending(x => x.Standing).ToList();
            return View(employee.ToList());

        }

        // GET: Manager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // GET: Manager/Create
        public ActionResult Create()
        {
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName");
            ViewBag.EmployeeStatusId = new SelectList(db.EmployeeStatus, "EmployeeStatusId", "CurrentStatus");
            return View();
        }

        // POST: Manager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EmployeeId,FirstName,LastName,Username,EmployeePassword,Email,Salary,VacationDays,JobTitle,ManagerId,Rating,SickDaysTotal,DepartmentId,EmployeeStatusId,StartDate,CurrentStatus")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Employees.Add(employee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName", employee.DepartmentId);
            ViewBag.EmployeeStatusId = new SelectList(db.EmployeeStatus, "EmployeeStatusId", "CurrentStatus", employee.EmployeeStatusId);
            return View(employee);
        }

        // GET: Manager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName", employee.DepartmentId);
            ViewBag.EmployeeStatusId = new SelectList(db.EmployeeStatus, "EmployeeStatusId", "CurrentStatus", employee.EmployeeStatusId);
            return View(employee);
        }

        // POST: Manager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmployeeId,FirstName,LastName,Username,EmployeePassword,Email,Salary,VacationDays,JobTitle,ManagerId,Rating,SickDaysTotal,DepartmentId,EmployeeStatusId")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName", employee.DepartmentId);
            ViewBag.EmployeeStatusId = new SelectList(db.EmployeeStatus, "EmployeeStatusId", "CurrentStatus", employee.EmployeeStatusId);
            return View(employee);
        }

        // GET: Manager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Manager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employee employee = db.Employees.Find(id);
            db.Employees.Remove(employee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
