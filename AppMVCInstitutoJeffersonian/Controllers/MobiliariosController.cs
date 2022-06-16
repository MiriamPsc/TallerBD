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
    public class MobiliariosController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Mobiliarios
        public ActionResult Index()
        {
            var mobiliario = db.Mobiliario.Include(m => m.Departamento).Include(m => m.TipoMobiliario).Include(m => m.Usuario).Include(m => m.Usuario1);
            return View(mobiliario.ToList());
        }

        // GET: Mobiliarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mobiliario mobiliario = db.Mobiliario.Find(id);
            if (mobiliario == null)
            {
                return HttpNotFound();
            }
            return View(mobiliario);
        }

        // GET: Mobiliarios/Create
        public ActionResult Create()
        {
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre");
            ViewBag.idTipoMobiliario = new SelectList(db.TipoMobiliario, "idTipoMobiliario", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Mobiliarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idMobiliario,codigo,idTipoMobiliario,idDepartamento,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Mobiliario mobiliario)
        {
            if (ModelState.IsValid)
            {
                db.Mobiliario.Add(mobiliario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", mobiliario.idDepartamento);
            ViewBag.idTipoMobiliario = new SelectList(db.TipoMobiliario, "idTipoMobiliario", "nombre", mobiliario.idTipoMobiliario);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", mobiliario.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", mobiliario.idUsuarioModifica);
            return View(mobiliario);
        }

        // GET: Mobiliarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mobiliario mobiliario = db.Mobiliario.Find(id);
            if (mobiliario == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", mobiliario.idDepartamento);
            ViewBag.idTipoMobiliario = new SelectList(db.TipoMobiliario, "idTipoMobiliario", "nombre", mobiliario.idTipoMobiliario);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", mobiliario.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", mobiliario.idUsuarioModifica);
            return View(mobiliario);
        }

        // POST: Mobiliarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idMobiliario,codigo,idTipoMobiliario,idDepartamento,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Mobiliario mobiliario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mobiliario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idDepartamento = new SelectList(db.Departamento, "idDepartamento", "nombre", mobiliario.idDepartamento);
            ViewBag.idTipoMobiliario = new SelectList(db.TipoMobiliario, "idTipoMobiliario", "nombre", mobiliario.idTipoMobiliario);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", mobiliario.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", mobiliario.idUsuarioModifica);
            return View(mobiliario);
        }

        // GET: Mobiliarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mobiliario mobiliario = db.Mobiliario.Find(id);
            if (mobiliario == null)
            {
                return HttpNotFound();
            }
            return View(mobiliario);
        }

        // POST: Mobiliarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Mobiliario mobiliario = db.Mobiliario.Find(id);
            db.Mobiliario.Remove(mobiliario);
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
