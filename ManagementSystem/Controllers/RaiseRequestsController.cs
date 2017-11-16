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
    public class RaiseRequestsController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: RaiseRequests
        public ActionResult Index()
        {
            var raiseRequests = db.RaiseRequests.Include(r => r.Employee);
            return View(raiseRequests.ToList());
        }

        // GET: RaiseRequests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequest raiseRequest = db.RaiseRequests.Find(id);
            if (raiseRequest == null)
            {
                return HttpNotFound();
            }
            return View(raiseRequest);
        }

        // GET: RaiseRequests/Create
        public ActionResult Create()
        {
            var session = (Employee)Session["employee"];
            var employeesByManager = (db.Employees.Where(x => x.ManagerId == session.EmployeeId).ToList());
            ViewBag.EmployeeId = new SelectList(employeesByManager, "EmployeeId", "FirstName");
            return View();
        }

        // POST: RaiseRequests/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RaiseRequestId,DateIssued,RaiseAmount,SendTo,ApprovalStatus,EmployeeId")] RaiseRequest raiseRequest)
        {
            if (ModelState.IsValid)
            {
                raiseRequest.DateIssued = System.DateTime.Now;
                raiseRequest.ApprovalStatus = "Pending";
                db.RaiseRequests.Add(raiseRequest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", raiseRequest.EmployeeId);
            return View(raiseRequest);
        }

        // GET: RaiseRequests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequest raiseRequest = db.RaiseRequests.Find(id);
            if (raiseRequest == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", raiseRequest.EmployeeId);
            return View(raiseRequest);
        }

        // POST: RaiseRequests/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RaiseRequestId,DateIssued,RaiseAmount,SendTo,ApprovalStatus,EmployeeId")] RaiseRequest raiseRequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(raiseRequest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", raiseRequest.EmployeeId);
            return View(raiseRequest);
        }

        // GET: RaiseRequests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RaiseRequest raiseRequest = db.RaiseRequests.Find(id);
            if (raiseRequest == null)
            {
                return HttpNotFound();
            }
            return View(raiseRequest);
        }

        // POST: RaiseRequests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RaiseRequest raiseRequest = db.RaiseRequests.Find(id);
            db.RaiseRequests.Remove(raiseRequest);
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
