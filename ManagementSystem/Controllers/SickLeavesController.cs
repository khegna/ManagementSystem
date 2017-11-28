using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ManagementSystem.Data;
using System.Net.Mail;

namespace ManagementSystem.Controllers
{
    public class SickLeavesController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: SickLeaves
        public ActionResult Index(string searchBy, string search)
        {

            var session = (Employee)Session["employee"];
            if (session != null)
            {
                ViewBag.SessionTitle = session.JobTitle;
            }
            if (session.JobTitle == "Manager")
            {
                var sickLeaveByManager = (db.SickLeaves.Where(x => x.Employee.ManagerId == session.EmployeeId).ToList());
                if (searchBy == "Approval Status")
                {
                    return View(sickLeaveByManager.Where(x => x.ApprovalStatus.StartsWith(search)).ToList());
                }
                if (searchBy == "Last name")
                {
                    return View(sickLeaveByManager.Where(x => x.Employee.LastName.StartsWith(search)).ToList());
                }
                if (searchBy == "Duration")
                {
                    return View(sickLeaveByManager.Where(x => x.Duration.ToString() == search).ToList());
                }
                var sickLeaveList = sickLeaveByManager.OrderBy(x => x.StartDate).ToList();
                return View(sickLeaveList.ToList());
            }

            if (session.JobTitle == "Human Resources")
            {
                var sickLeaves = db.SickLeaves.Include(s => s.Employee);
                if (searchBy == "Approval Status")
                {
                    return View(sickLeaves.Where(x => x.ApprovalStatus.StartsWith(search)).ToList());
                }
                if (searchBy == "Last name")
                {
                    return View(sickLeaves.Where(x => x.Employee.LastName.StartsWith(search)).ToList());
                }
                if (searchBy == "Duration")
                {
                    return View(sickLeaves.Where(x => x.Duration.ToString() == search).ToList());
                }
                if (searchBy == "Need HR Approval")
                {
                    return View(sickLeaves.Where(x => x.ApprovalStatus.ToString() == "Pending HR approval").ToList());
                }
                var sickLeaveList = db.SickLeaves.Include(r => r.Employee);
               
                return View(sickLeaveList.ToList());
            }
           
            return View();
        }

        public ActionResult GetSickLeavesByEmployee()
        {
            var session = (Employee)Session["employee"];

            var sickLeaveByEmployee = (db.SickLeaves.Where(x => x.Employee.EmployeeId == session.EmployeeId).ToList());
            return View(sickLeaveByEmployee);

        }
        public ActionResult SickLeaveRequestSuccess()
        {
            return View();
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
                sickLeave.EmployeeId = ((Employee)Session["employee"]).EmployeeId;
                var employeeFilingSL = (Employee)Session["employee"];
                var employeesManager = ((Employee)Session["employee"]).ManagerId;
                var managerOfEmployee = db.Employees.Where(x => x.EmployeeId == employeesManager).FirstOrDefault();
                var managerEmail = managerOfEmployee.Email;
                SendEmail(managerEmail, employeeFilingSL);
                sickLeave.ApprovalStatus = "Request Pending";
                db.SickLeaves.Add(sickLeave);
                db.SaveChanges();
                return RedirectToAction("SickLeaveRequestSuccess");
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
            ViewBag.Employees = db.Employees.Where(x => x.EmployeeId == sickLeave.EmployeeId).FirstOrDefault();
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
                if (sickLeave.ApprovalStatus == "Approved")
                {
                    var employee = db.Employees.Where(x => x.EmployeeId == sickLeave.EmployeeId).FirstOrDefault();
                    employee.SickDaysTotal = employee.SickDaysTotal - sickLeave.Duration;
                    db.Entry(employee).State = EntityState.Modified;
                    db.SaveChanges();
                }
                
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
            sickLeave.SendTo= "Human Resourses";
            sickLeave.ApprovalStatus = "Pending HR approval";
            db.Entry(sickLeave).State = EntityState.Modified;
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

        [NonAction]
        public void SendEmail(string email, Employee employee)
        {
            var fromEmail = new MailAddress("kriheg1234@gmail.com", "Management System");
            var toEmail = new MailAddress(email);
            var fromEmailPassword = "Hegkri89";
            string subject = "A new Sick Leave Request was createrd";
            string body = "<br/><br/>" + employee.FirstName + " " + employee.LastName+ " "+"created a new sick leave request." + "<br/><br/>"+
                "Please login to you Management System account for further information";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromEmail.Address, fromEmailPassword)
            };
            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
                smtp.Send(message);

        }
    }
}
