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
    public class TipoInstitucionsController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: TipoInstitucions
        public ActionResult Index()
        {
            var tipoInstitucion = db.TipoInstitucion.Include(t => t.Usuario).Include(t => t.Usuario1);
            return View(tipoInstitucion.ToList());
        }

        // GET: TipoInstitucions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoInstitucion tipoInstitucion = db.TipoInstitucion.Find(id);
            if (tipoInstitucion == null)
            {
                return HttpNotFound();
            }
            return View(tipoInstitucion);
        }

        // GET: TipoInstitucions/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: TipoInstitucions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idTipoInstitucion,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoInstitucion tipoInstitucion)
        {
            if (ModelState.IsValid)
            {
                db.TipoInstitucion.Add(tipoInstitucion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstitucion.idUsuarioModifica);
            return View(tipoInstitucion);
        }

        // GET: TipoInstitucions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoInstitucion tipoInstitucion = db.TipoInstitucion.Find(id);
            if (tipoInstitucion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstitucion.idUsuarioModifica);
            return View(tipoInstitucion);
        }

        // POST: TipoInstitucions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idTipoInstitucion,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoInstitucion tipoInstitucion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoInstitucion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstitucion.idUsuarioModifica);
            return View(tipoInstitucion);
        }

        // GET: TipoInstitucions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoInstitucion tipoInstitucion = db.TipoInstitucion.Find(id);
            if (tipoInstitucion == null)
            {
                return HttpNotFound();
            }
            return View(tipoInstitucion);
        }

        // POST: TipoInstitucions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TipoInstitucion tipoInstitucion = db.TipoInstitucion.Find(id);
            db.TipoInstitucion.Remove(tipoInstitucion);
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
