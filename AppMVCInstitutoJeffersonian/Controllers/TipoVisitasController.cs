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
    public class TipoVisitasController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: TipoVisitas
        public ActionResult Index()
        {
            var tipoVisita = db.TipoVisita.Include(t => t.Usuario).Include(t => t.Usuario1);
            return View(tipoVisita.ToList());
        }

        // GET: TipoVisitas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoVisita tipoVisita = db.TipoVisita.Find(id);
            if (tipoVisita == null)
            {
                return HttpNotFound();
            }
            return View(tipoVisita);
        }

        // GET: TipoVisitas/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: TipoVisitas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idTipoVisita,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoVisita tipoVisita)
        {
            if (ModelState.IsValid)
            {
                db.TipoVisita.Add(tipoVisita);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoVisita.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoVisita.idUsuarioModifica);
            return View(tipoVisita);
        }

        // GET: TipoVisitas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoVisita tipoVisita = db.TipoVisita.Find(id);
            if (tipoVisita == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoVisita.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoVisita.idUsuarioModifica);
            return View(tipoVisita);
        }

        // POST: TipoVisitas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idTipoVisita,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoVisita tipoVisita)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoVisita).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoVisita.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoVisita.idUsuarioModifica);
            return View(tipoVisita);
        }

        // GET: TipoVisitas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoVisita tipoVisita = db.TipoVisita.Find(id);
            if (tipoVisita == null)
            {
                return HttpNotFound();
            }
            return View(tipoVisita);
        }

        // POST: TipoVisitas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TipoVisita tipoVisita = db.TipoVisita.Find(id);
            db.TipoVisita.Remove(tipoVisita);
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
