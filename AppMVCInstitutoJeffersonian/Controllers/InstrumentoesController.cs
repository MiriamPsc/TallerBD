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
    public class InstrumentoesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Instrumentoes
        public ActionResult Index()
        {
            var instrumento = db.Instrumento.Include(i => i.Departamento).Include(i => i.TipoInstrumento).Include(i => i.Usuario).Include(i => i.Usuario1);
            return View(instrumento.ToList());
        }

        // GET: Instrumentoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Instrumento instrumento = db.Instrumento.Find(id);
            if (instrumento == null)
            {
                return HttpNotFound();
            }
            return View(instrumento);
        }

        // GET: Instrumentoes/Create
        public ActionResult Create()
        {
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre");
            ViewBag.idTipoInstrumento = new SelectList(db.TipoInstrumento, "idTipoInstrumento", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Instrumentoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idInstrumento,codigo,idTipoInstrumento,idDepartamento,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Instrumento instrumento)
        {
            if (ModelState.IsValid)
            {
                db.Instrumento.Add(instrumento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", instrumento.idDepartamento);
            ViewBag.idTipoInstrumento = new SelectList(db.TipoInstrumento, "idTipoInstrumento", "nombre", instrumento.idTipoInstrumento);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", instrumento.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", instrumento.idUsuarioModifica);
            return View(instrumento);
        }

        // GET: Instrumentoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Instrumento instrumento = db.Instrumento.Find(id);
            if (instrumento == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", instrumento.idDepartamento);
            ViewBag.idTipoInstrumento = new SelectList(db.TipoInstrumento, "idTipoInstrumento", "nombre", instrumento.idTipoInstrumento);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", instrumento.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", instrumento.idUsuarioModifica);
            return View(instrumento);
        }

        // POST: Instrumentoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idInstrumento,codigo,idTipoInstrumento,idDepartamento,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Instrumento instrumento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(instrumento).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", instrumento.idDepartamento);
            ViewBag.idTipoInstrumento = new SelectList(db.TipoInstrumento, "idTipoInstrumento", "nombre", instrumento.idTipoInstrumento);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", instrumento.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", instrumento.idUsuarioModifica);
            return View(instrumento);
        }

        // GET: Instrumentoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Instrumento instrumento = db.Instrumento.Find(id);
            if (instrumento == null)
            {
                return HttpNotFound();
            }
            return View(instrumento);
        }

        // POST: Instrumentoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Instrumento instrumento = db.Instrumento.Find(id);
            db.Instrumento.Remove(instrumento);
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
