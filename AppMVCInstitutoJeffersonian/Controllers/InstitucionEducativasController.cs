using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AppMVCInstitutoJeffersonian.Models;

namespace AppMVCInstitutoJeffersonian.Controllers
{
    public class InstitucionEducativasController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: InstitucionEducativas
        public ActionResult Index()
        {
            var institucionEducativa = db.InstitucionEducativa.Include(i => i.Usuario).Include(i => i.Usuario1);
            return View(institucionEducativa.ToList());
        }

        // GET: InstitucionEducativas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InstitucionEducativa institucionEducativa = db.InstitucionEducativa.Find(id);
            if (institucionEducativa == null)
            {
                return HttpNotFound();
            }
            return View(institucionEducativa);
        }

        // GET: InstitucionEducativas/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: InstitucionEducativas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idInstitucionEducativa,nombre,ciudad,estado,pais,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] InstitucionEducativa institucionEducativa)
        {
            if (ModelState.IsValid)
            {
                db.InstitucionEducativa.Add(institucionEducativa);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", institucionEducativa.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", institucionEducativa.idUsuarioModifica);
            return View(institucionEducativa);
        }

        // GET: InstitucionEducativas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InstitucionEducativa institucionEducativa = db.InstitucionEducativa.Find(id);
            if (institucionEducativa == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", institucionEducativa.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", institucionEducativa.idUsuarioModifica);
            return View(institucionEducativa);
        }

        // POST: InstitucionEducativas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idInstitucionEducativa,nombre,ciudad,estado,pais,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] InstitucionEducativa institucionEducativa)
        {
            if (ModelState.IsValid)
            {
                db.Entry(institucionEducativa).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", institucionEducativa.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", institucionEducativa.idUsuarioModifica);
            return View(institucionEducativa);
        }

        // GET: InstitucionEducativas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InstitucionEducativa institucionEducativa = db.InstitucionEducativa.Find(id);
            if (institucionEducativa == null)
            {
                return HttpNotFound();
            }
            return View(institucionEducativa);
        }

        // POST: InstitucionEducativas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            InstitucionEducativa institucionEducativa = db.InstitucionEducativa.Find(id);
            db.InstitucionEducativa.Remove(institucionEducativa);
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
