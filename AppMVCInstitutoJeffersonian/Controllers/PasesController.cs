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
    public class PasesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Pases
        public ActionResult Index()
        {
            var pase = db.Pase.Include(p => p.Institucion).Include(p => p.TipoPase).Include(p => p.Usuario).Include(p => p.Usuario1);
            return View(pase.ToList());
        }

        // GET: Pases/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pase pase = db.Pase.Find(id);
            if (pase == null)
            {
                return HttpNotFound();
            }
            return View(pase);
        }

        // GET: Pases/Create
        public ActionResult Create()
        {
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre");
            ViewBag.idTipoPase = new SelectList(db.TipoPase, "idTipoPase", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Pases/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPase,codigo,fechaInicio,fechaFinal,idTipoPase,idInstitucion,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Pase pase)
        {
            if (ModelState.IsValid)
            {
                db.Pase.Add(pase);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", pase.idInstitucion);
            ViewBag.idTipoPase = new SelectList(db.TipoPase, "idTipoPase", "nombre", pase.idTipoPase);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", pase.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", pase.idUsuarioModifica);
            return View(pase);
        }

        // GET: Pases/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pase pase = db.Pase.Find(id);
            if (pase == null)
            {
                return HttpNotFound();
            }
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", pase.idInstitucion);
            ViewBag.idTipoPase = new SelectList(db.TipoPase, "idTipoPase", "nombre", pase.idTipoPase);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", pase.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", pase.idUsuarioModifica);
            return View(pase);
        }

        // POST: Pases/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPase,codigo,fechaInicio,fechaFinal,idTipoPase,idInstitucion,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Pase pase)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pase).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", pase.idInstitucion);
            ViewBag.idTipoPase = new SelectList(db.TipoPase, "idTipoPase", "nombre", pase.idTipoPase);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", pase.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", pase.idUsuarioModifica);
            return View(pase);
        }

        // GET: Pases/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pase pase = db.Pase.Find(id);
            if (pase == null)
            {
                return HttpNotFound();
            }
            return View(pase);
        }

        // POST: Pases/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Pase pase = db.Pase.Find(id);
            db.Pase.Remove(pase);
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
