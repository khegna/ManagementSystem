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
    public class SickLeavesController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: SickLeaves
        public ActionResult Index()
        {
            var sickLeaves = db.SickLeaves.Include(s => s.Employee);
            return View(sickLeaves.ToList());
        }

        // GET: SickLeaves/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SickLeave sickLeave = db.SickLeaves.Find(id);
            if (sickLeave == null)
            {
                return HttpNotFound();
            }
            return View(sickLeave);
        }

        // GET: SickLeaves/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName");
            return View();
        }

        // POST: SickLeaves/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SickLeaveId,StartDate,Duration,ApprovalStatus,EmployeeId")] SickLeave sickLeave)
        {
            if (ModelState.IsValid)
            {
                db.SickLeaves.Add(sickLeave);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", sickLeave.EmployeeId);
            return View(sickLeave);
        }

        // GET: SickLeaves/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SickLeave sickLeave = db.SickLeaves.Find(id);
            if (sickLeave == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", sickLeave.EmployeeId);
            return View(sickLeave);
        }

        // POST: SickLeaves/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SickLeaveId,StartDate,Duration,ApprovalStatus,EmployeeId")] SickLeave sickLeave)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sickLeave).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", sickLeave.EmployeeId);
            return View(sickLeave);
        }

        // GET: SickLeaves/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SickLeave sickLeave = db.SickLeaves.Find(id);
            if (sickLeave == null)
            {
                return HttpNotFound();
            }
            return View(sickLeave);
        }

        // POST: SickLeaves/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SickLeave sickLeave = db.SickLeaves.Find(id);
            db.SickLeaves.Remove(sickLeave);
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
