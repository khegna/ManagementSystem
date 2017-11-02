using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ManagementSystem.Data;

namespace ManagementSystem.Controllers
{
    public class VacationsController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: Vacations
        public ActionResult Index(string searchBy, string search)
        {

            var session = (Employee)Session["employee"];
            ViewBag.SessionTitle = session.JobTitle;
            if (session.JobTitle == "Manager")
            {
                var vacationByManager = (db.Vacations.Where(x => x.Employee.ManagerId == session.EmployeeId).ToList());
                if (searchBy == "Approval Status")
                {
                    return View(vacationByManager.Where(x => x.AprovalStatus.StartsWith(search)).ToList());
                }
                if (searchBy == "Last name")
                {
                    return View(vacationByManager.Where(x => x.Employee.LastName.StartsWith(search)).ToList());
                }
                if (searchBy == "Duration")
                {
                    return View(vacationByManager.Where(x => x.Duration.ToString() == search).ToList());
                }
                var sickLeaveList = vacationByManager.OrderBy(x => x.StartDate).ToList();
                return View(sickLeaveList.ToList());
            }

            if (session.JobTitle == "Human Resources")
            {
              
               var vacation = (db.Vacations.Where(x => x.AprovalStatus == "Pending HR Approval").ToList());
                if (searchBy == "Approval Status")
                {
                    return View(vacation.Where(x => x.AprovalStatus.StartsWith(search)).ToList());
                }
                if (searchBy == "Last name")
                {
                    return View(vacation.Where(x => x.Employee.LastName.StartsWith(search)).ToList());
                }
                if (searchBy == "Duration")
                {
                    return View(vacation.Where(x => x.Duration.ToString() == search).ToList());
                }
                if (searchBy == "Need HR Approval")
                {
                    return View(vacation.Where(x => x.AprovalStatus.ToString() == "Pending HR approval").ToList());
                }
               

                return View(vacation.ToList());
            }
            return View();
        }
        public ActionResult GetVacationByEmployee() {
            var session = (Employee)Session["employee"];

            var vacationByEmployee = (db.Vacations.Where(x => x.Employee.EmployeeId == session.EmployeeId).ToList());
            return View(vacationByEmployee);

        }


        // GET: Vacations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vacation vacation = db.Vacations.Find(id);
            if (vacation == null)
            {
                return HttpNotFound();
            }
            return View(vacation);
        }

        // GET: Vacations/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName");
            return View();
        }

        // POST: Vacations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "VacationId,StartDate,Duration,AprovalStatus,EmployeeId")] Vacation vacation)
        {
            if (ModelState.IsValid)
            {
                vacation.EmployeeId = ((Employee)Session["employee"]).EmployeeId;
                vacation.AprovalStatus = "Request Pending";
                db.Vacations.Add(vacation);
                db.SaveChanges();
                return RedirectToAction("VacationRequestSuccess");
            }

            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", vacation.EmployeeId);
            return View(vacation);
        }
        public ActionResult VacationRequestSuccess()
        {
            return View();
        }

        // GET: Vacations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vacation vacation = db.Vacations.Find(id);
            if (vacation == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", vacation.EmployeeId);
            var session = (Employee)Session["employee"];
            ViewBag.sessionTitle = session.JobTitle;
            ViewBag.Employees = db.Employees.Where(x => x.EmployeeId == vacation.EmployeeId).FirstOrDefault();
            ViewBag.daysAfter = (ViewBag.Employees).VacationDays - vacation.Duration;

            return View(vacation);
        }

        // POST: Vacations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "VacationId,StartDate,Duration,AprovalStatus,EmployeeId")] Vacation vacation)
        {
            if (ModelState.IsValid)
            {
                if (vacation.AprovalStatus == "Approved")
                {
                    var employee = db.Employees.Where(x => x.EmployeeId == vacation.EmployeeId).FirstOrDefault();
                    employee.VacationDays = employee.VacationDays - vacation.Duration;
                    db.Entry(employee).State = EntityState.Modified;
                    db.SaveChanges();
                }

                db.Entry(vacation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", vacation.EmployeeId);
            return View(vacation);
        }

        // GET: Vacations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vacation vacation = db.Vacations.Find(id);
            if (vacation == null)
            {
                return HttpNotFound();
            }
            return View(vacation);
        }

        // POST: Vacations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            Vacation vacation = db.Vacations.Find(id);
            vacation.SendTo = "Human Resourses";
            vacation.AprovalStatus = "Pending HR approval";
            db.Entry(vacation).State = EntityState.Modified;
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
