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
    public class ComplaintsController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: Complaints
        public ActionResult Index()
        {
            var session = (Employee)Session["employee"];
            ViewBag.sessionID = session;
            if (session.JobTitle == "Manager")
            {
                var complaintByManager = (db.Complaints.Where(x => x.Employee.ManagerId == session.EmployeeId).ToList());
                var complaintsByView = (complaintByManager.Where(x => x.SendTo == "Manager").ToList());
                return View(complaintsByView);

            }
            if (session.JobTitle == "Employee") {
                var complaintByEmployee = (db.Complaints.Where(x => x.EmployeeId == session.EmployeeId).ToList());
                return View(complaintByEmployee);
            }

            var complaints = db.Complaints.Include(c => c.Employee);
            return View(complaints.ToList());
        }


        public ActionResult GetComplaintsByEmployee()
        {
            var session = (Employee)Session["employee"];

            var complaintsByEmployee = (db.Complaints.Where(x => x.Employee.EmployeeId == session.EmployeeId).ToList());
            return View(complaintsByEmployee);

        }
        public ActionResult ComplaintRequestSuccess()
        {
            return View();
        }

        // GET: Complaints/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Complaint complaint = db.Complaints.Find(id);
            if (complaint == null)
            {
                return HttpNotFound();
            }
            var session = (Employee)Session["employee"];
            if (session.JobTitle == "Manager")
            {
                complaint.ViewedByManager = true;
                db.Entry(complaint).State = EntityState.Modified;
                db.SaveChanges();
            }
            if (session.JobTitle == "Human Resources")
            {
                complaint.ViewedByHR = true;
                db.Entry(complaint).State = EntityState.Modified;
                db.SaveChanges();
            }
            return View(complaint);
        }

        // GET: Complaints/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName");
            return View();
        }

        // POST: Complaints/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ComplaintId,ComplaintDescription,DateFiled,SeverityLevel,EmployeeId,Resolved")] Complaint complaint)
        {
            if (ModelState.IsValid)
            {
                complaint.EmployeeId = ((Employee)Session["employee"]).EmployeeId;
                complaint.Resolved = false;
                complaint.SendTo = "Human Resources";
                complaint.ViewedByHR = false;
                complaint.ViewedByManager = false;
                complaint.DateFiled = System.DateTime.Now;
                db.Complaints.Add(complaint);
                db.SaveChanges();
                return RedirectToAction("ComplaintRequestSuccess");
            }

            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", complaint.EmployeeId);
            return View(complaint);
        }

        // GET: Complaints/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Complaint complaint = db.Complaints.Find(id);
            if (complaint == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", complaint.EmployeeId);
            return View(complaint);
        }

        // POST: Complaints/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ComplaintId,ComplaintDescription,DateFiled,SeverityLevel,EmployeeId,Resolved")] Complaint complaint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(complaint).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", complaint.EmployeeId);
            return View(complaint);
        }

        // GET: Complaints/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Complaint complaint = db.Complaints.Find(id);
            if (complaint == null)
            {
                return HttpNotFound();
            }
            return View(complaint);
        }

        // POST: Complaints/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Complaint complaint = db.Complaints.Find(id);
            complaint.SendTo = "Manager";
            db.Entry(complaint).State = EntityState.Modified;
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
