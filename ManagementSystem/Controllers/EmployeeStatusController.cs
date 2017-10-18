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
    public class EmployeeStatusController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: EmployeeStatus
        public ActionResult Index()
        {
            return View(db.EmployeeStatus.ToList());
        }

        // GET: EmployeeStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeStatu employeeStatu = db.EmployeeStatus.Find(id);
            if (employeeStatu == null)
            {
                return HttpNotFound();
            }
            return View(employeeStatu);
        }

        // GET: EmployeeStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: EmployeeStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EmployeeStatusId,TreminationDate,FinalDate")] EmployeeStatu employeeStatu)
        {
            if (ModelState.IsValid)
            {
                var session = (Employee)Session["employee"];
                employeeStatu.EmployeeId = session.EmployeeId;
                employeeStatu.FinalDate = DateTime.Today.AddDays(14);
                ViewBag.FirstName = session.FirstName;
                ViewBag.LastName = session.LastName;
                ViewBag.LastDay = employeeStatu.FinalDate;
                db.Entry(employeeStatu).State = EntityState.Modified;
                db.EmployeeStatus.Add(employeeStatu);
                db.SaveChanges();
                return RedirectToAction("Resignation");
            }

            return View(employeeStatu);
        }

        // GET: EmployeeStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeStatu employeeStatu = db.EmployeeStatus.Find(id);
            if (employeeStatu == null)
            {
                return HttpNotFound();
            }
            return View(employeeStatu);
        }

        // POST: EmployeeStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmployeeStatusId,TreminationDate,FinalDate")] EmployeeStatu employeeStatu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employeeStatu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(employeeStatu);
        }

        // GET: EmployeeStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeStatu employeeStatu = db.EmployeeStatus.Find(id);
            if (employeeStatu == null)
            {
                return HttpNotFound();
            }
            return View(employeeStatu);
        }

        // POST: EmployeeStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EmployeeStatu employeeStatu = db.EmployeeStatus.Find(id);
            db.EmployeeStatus.Remove(employeeStatu);
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
        public ActionResult Resignation()
        {
            var session = (Employee)Session["employee"];
            ViewBag.FirstName = session.FirstName;
            ViewBag.LastName = session.LastName;
            ViewBag.LastDay = DateTime.Today.AddDays(14);
            return View();
        }
    }
}
