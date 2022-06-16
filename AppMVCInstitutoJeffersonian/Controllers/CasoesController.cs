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
    public class CasoesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Casoes
        public ActionResult Index()
        {
            var caso = db.Caso.Include(c => c.Equipo).Include(c => c.Especialidad).Include(c => c.Usuario).Include(c => c.Usuario1);
            return View(caso.ToList());
        }

        // GET: Casoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Caso caso = db.Caso.Find(id);
            if (caso == null)
            {
                return HttpNotFound();
            }
            return View(caso);
        }

        // GET: Casoes/Create
        public ActionResult Create()
        {
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo");
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Casoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCaso,codigo,estado,fechaInicio,fechaCierre,idEquipo,idEspecialidad,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Caso caso)
        {
            if (ModelState.IsValid)
            {
                db.Caso.Add(caso);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo", caso.idEquipo);
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre", caso.idEspecialidad);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", caso.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", caso.idUsuarioModifica);
            return View(caso);
        }

        // GET: Casoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Caso caso = db.Caso.Find(id);
            if (caso == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo", caso.idEquipo);
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre", caso.idEspecialidad);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", caso.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", caso.idUsuarioModifica);
            return View(caso);
        }

        // POST: Casoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCaso,codigo,estado,fechaInicio,fechaCierre,idEquipo,idEspecialidad,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Caso caso)
        {
            if (ModelState.IsValid)
            {
                db.Entry(caso).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo", caso.idEquipo);
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre", caso.idEspecialidad);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", caso.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", caso.idUsuarioModifica);
            return View(caso);
        }

        // GET: Casoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Caso caso = db.Caso.Find(id);
            if (caso == null)
            {
                return HttpNotFound();
            }
            return View(caso);
        }

        // POST: Casoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Caso caso = db.Caso.Find(id);
            db.Caso.Remove(caso);
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
