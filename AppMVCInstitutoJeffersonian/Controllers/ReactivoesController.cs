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
    public class ReactivoesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Reactivoes
        public ActionResult Index()
        {
            var reactivo = db.Reactivo.Include(r => r.Usuario).Include(r => r.Usuario1);
            return View(reactivo.ToList());
        }

        // GET: Reactivoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reactivo reactivo = db.Reactivo.Find(id);
            if (reactivo == null)
            {
                return HttpNotFound();
            }
            return View(reactivo);
        }

        // GET: Reactivoes/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Reactivoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idReactivo,nombre,formula,tipo,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Reactivo reactivo)
        {
            if (ModelState.IsValid)
            {
                db.Reactivo.Add(reactivo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", reactivo.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", reactivo.idUsuarioModifica);
            return View(reactivo);
        }

        // GET: Reactivoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reactivo reactivo = db.Reactivo.Find(id);
            if (reactivo == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", reactivo.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", reactivo.idUsuarioModifica);
            return View(reactivo);
        }

        // POST: Reactivoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idReactivo,nombre,formula,tipo,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Reactivo reactivo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reactivo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", reactivo.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", reactivo.idUsuarioModifica);
            return View(reactivo);
        }

        // GET: Reactivoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reactivo reactivo = db.Reactivo.Find(id);
            if (reactivo == null)
            {
                return HttpNotFound();
            }
            return View(reactivo);
        }

        // POST: Reactivoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reactivo reactivo = db.Reactivo.Find(id);
            db.Reactivo.Remove(reactivo);
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
