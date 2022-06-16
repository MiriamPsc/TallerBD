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
    public class TipoMobiliariosController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: TipoMobiliarios
        public ActionResult Index()
        {
            var tipoMobiliario = db.TipoMobiliario.Include(t => t.Usuario).Include(t => t.Usuario1);
            return View(tipoMobiliario.ToList());
        }

        // GET: TipoMobiliarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoMobiliario tipoMobiliario = db.TipoMobiliario.Find(id);
            if (tipoMobiliario == null)
            {
                return HttpNotFound();
            }
            return View(tipoMobiliario);
        }

        // GET: TipoMobiliarios/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: TipoMobiliarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idTipoMobiliario,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoMobiliario tipoMobiliario)
        {
            if (ModelState.IsValid)
            {
                db.TipoMobiliario.Add(tipoMobiliario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoMobiliario.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoMobiliario.idUsuarioModifica);
            return View(tipoMobiliario);
        }

        // GET: TipoMobiliarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoMobiliario tipoMobiliario = db.TipoMobiliario.Find(id);
            if (tipoMobiliario == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoMobiliario.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoMobiliario.idUsuarioModifica);
            return View(tipoMobiliario);
        }

        // POST: TipoMobiliarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idTipoMobiliario,nombre,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] TipoMobiliario tipoMobiliario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoMobiliario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", tipoMobiliario.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", tipoMobiliario.idUsuarioModifica);
            return View(tipoMobiliario);
        }

        // GET: TipoMobiliarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoMobiliario tipoMobiliario = db.TipoMobiliario.Find(id);
            if (tipoMobiliario == null)
            {
                return HttpNotFound();
            }
            return View(tipoMobiliario);
        }

        // POST: TipoMobiliarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TipoMobiliario tipoMobiliario = db.TipoMobiliario.Find(id);
            db.TipoMobiliario.Remove(tipoMobiliario);
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
