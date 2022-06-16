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
    public class InstitucionsController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Institucions
        public ActionResult Index()
        {
            var institucion = db.Institucion.Include(i => i.TipoInstitucion).Include(i => i.Usuario).Include(i => i.Usuario1);
            return View(institucion.ToList());
        }

        // GET: Institucions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Institucion institucion = db.Institucion.Find(id);
            if (institucion == null)
            {
                return HttpNotFound();
            }
            return View(institucion);
        }

        // GET: Institucions/Create
        public ActionResult Create()
        {
            ViewBag.idTipoInstitucion = new SelectList(db.TipoInstitucion, "idTipoInstitucion", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Institucions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idInstitucion,nombre,codigo,ciudad,pais,idTipoInstitucion,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Institucion institucion)
        {
            if (ModelState.IsValid)
            {
                db.Institucion.Add(institucion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idTipoInstitucion = new SelectList(db.TipoInstitucion, "idTipoInstitucion", "nombre", institucion.idTipoInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", institucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", institucion.idUsuarioModifica);
            return View(institucion);
        }

        // GET: Institucions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Institucion institucion = db.Institucion.Find(id);
            if (institucion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idTipoInstitucion = new SelectList(db.TipoInstitucion, "idTipoInstitucion", "nombre", institucion.idTipoInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", institucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", institucion.idUsuarioModifica);
            return View(institucion);
        }

        // POST: Institucions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idInstitucion,nombre,codigo,ciudad,pais,idTipoInstitucion,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Institucion institucion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(institucion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idTipoInstitucion = new SelectList(db.TipoInstitucion, "idTipoInstitucion", "nombre", institucion.idTipoInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", institucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", institucion.idUsuarioModifica);
            return View(institucion);
        }

        // GET: Institucions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Institucion institucion = db.Institucion.Find(id);
            if (institucion == null)
            {
                return HttpNotFound();
            }
            return View(institucion);
        }

        // POST: Institucions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Institucion institucion = db.Institucion.Find(id);
            db.Institucion.Remove(institucion);
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
