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
    public class TipoInstrumentoesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: TipoInstrumentoes
        public ActionResult Index()
        {
            var tipoInstrumento = db.TipoInstrumento.Include(t => t.Usuario).Include(t => t.Usuario1);
            return View(tipoInstrumento.ToList());
        }

        // GET: TipoInstrumentoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoInstrumento tipoInstrumento = db.TipoInstrumento.Find(id);
            if (tipoInstrumento == null)
            {
                return HttpNotFound();
            }
            return View(tipoInstrumento);
        }

        // GET: TipoInstrumentoes/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: TipoInstrumentoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idTipoInstrumento,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoInstrumento tipoInstrumento)
        {
            if (ModelState.IsValid)
            {
                db.TipoInstrumento.Add(tipoInstrumento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstrumento.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstrumento.idUsuarioModifica);
            return View(tipoInstrumento);
        }

        // GET: TipoInstrumentoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoInstrumento tipoInstrumento = db.TipoInstrumento.Find(id);
            if (tipoInstrumento == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstrumento.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstrumento.idUsuarioModifica);
            return View(tipoInstrumento);
        }

        // POST: TipoInstrumentoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idTipoInstrumento,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoInstrumento tipoInstrumento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoInstrumento).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstrumento.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoInstrumento.idUsuarioModifica);
            return View(tipoInstrumento);
        }

        // GET: TipoInstrumentoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoInstrumento tipoInstrumento = db.TipoInstrumento.Find(id);
            if (tipoInstrumento == null)
            {
                return HttpNotFound();
            }
            return View(tipoInstrumento);
        }

        // POST: TipoInstrumentoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TipoInstrumento tipoInstrumento = db.TipoInstrumento.Find(id);
            db.TipoInstrumento.Remove(tipoInstrumento);
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
