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
    public class ProfilePicturesController : Controller
    {
        private ManagementSystemEntities db = new ManagementSystemEntities();

        // GET: ProfilePictures
        public ActionResult Index()
        {
            var user = (Employee)Session["employee"];
            var profilePicture = (db.ProfilePictures.Where(x => x.EmployeeId == user.EmployeeId).FirstOrDefault());
            ViewBag.picture = profilePicture.Picture;
            return View(profilePicture);
        }

        // GET: ProfilePictures/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProfilePicture profilePicture = db.ProfilePictures.Find(id);
            if (profilePicture == null)
            {
                return HttpNotFound();
            }
            return View(profilePicture);
        }

        // GET: ProfilePictures/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName");
            ViewBag.success = "null";
            return View();
        }

        [HttpPost]
        public ActionResult Create(ProfilePicture profilePicture, HttpPostedFileBase image1)
        {
            var user = (Employee)Session["employee"];
            if (user != null && image1 != null)
            {
            
                profilePicture.EmployeeId = user.EmployeeId;
                profilePicture.Picture = new byte[image1.ContentLength];
                image1.InputStream.Read(profilePicture.Picture, 0, image1.ContentLength);
                Session["picture"] = profilePicture.Picture;

            }
            else {
                return View();
            }
            db.ProfilePictures.Add(profilePicture);



            db.SaveChanges();
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", profilePicture.EmployeeId);
            ViewBag.success = "Your profile picture has been uploaded";
            return View(profilePicture);
        }



        // GET: ProfilePictures/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProfilePicture profilePicture = db.ProfilePictures.Find(id);
            if (profilePicture == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", profilePicture.EmployeeId);
            return View(profilePicture);
        }

        // POST: ProfilePictures/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProfilePictureId,Picture,EmployeeId")] ProfilePicture profilePicture)
        {
            if (ModelState.IsValid)
            {
                db.Entry(profilePicture).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "FirstName", profilePicture.EmployeeId);
            return View(profilePicture);
        }

        // GET: ProfilePictures/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProfilePicture profilePicture = db.ProfilePictures.Find(id);
            if (profilePicture == null)
            {
                return HttpNotFound();
            }
            return View(profilePicture);
        }

        // POST: ProfilePictures/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProfilePicture profilePicture = db.ProfilePictures.Find(id);
            db.ProfilePictures.Remove(profilePicture);
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
