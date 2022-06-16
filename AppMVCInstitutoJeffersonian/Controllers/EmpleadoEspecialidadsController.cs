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
    public class EmpleadoEspecialidadsController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: EmpleadoEspecialidads
        public ActionResult Index()
        {
            var empleadoEspecialidad = db.EmpleadoEspecialidad.Include(e => e.Empleado).Include(e => e.Especialidad).Include(e => e.Usuario).Include(e => e.Usuario1);
            return View(empleadoEspecialidad.ToList());
        }

        // GET: EmpleadoEspecialidads/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoEspecialidad empleadoEspecialidad = db.EmpleadoEspecialidad.Find(id);
            if (empleadoEspecialidad == null)
            {
                return HttpNotFound();
            }
            return View(empleadoEspecialidad);
        }

        // GET: EmpleadoEspecialidads/Create
        public ActionResult Create()
        {
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero");
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: EmpleadoEspecialidads/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEmpleadoEspecialidad,idEmpleado,idEspecialidad,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] EmpleadoEspecialidad empleadoEspecialidad)
        {
            if (ModelState.IsValid)
            {
                db.EmpleadoEspecialidad.Add(empleadoEspecialidad);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoEspecialidad.idEmpleado);
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre", empleadoEspecialidad.idEspecialidad);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEspecialidad.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEspecialidad.idUsuarioModifica);
            return View(empleadoEspecialidad);
        }

        // GET: EmpleadoEspecialidads/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoEspecialidad empleadoEspecialidad = db.EmpleadoEspecialidad.Find(id);
            if (empleadoEspecialidad == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoEspecialidad.idEmpleado);
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre", empleadoEspecialidad.idEspecialidad);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEspecialidad.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEspecialidad.idUsuarioModifica);
            return View(empleadoEspecialidad);
        }

        // POST: EmpleadoEspecialidads/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEmpleadoEspecialidad,idEmpleado,idEspecialidad,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] EmpleadoEspecialidad empleadoEspecialidad)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleadoEspecialidad).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoEspecialidad.idEmpleado);
            ViewBag.idEspecialidad = new SelectList(db.Especialidad, "idEspecialidad", "nombre", empleadoEspecialidad.idEspecialidad);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEspecialidad.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEspecialidad.idUsuarioModifica);
            return View(empleadoEspecialidad);
        }

        // GET: EmpleadoEspecialidads/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoEspecialidad empleadoEspecialidad = db.EmpleadoEspecialidad.Find(id);
            if (empleadoEspecialidad == null)
            {
                return HttpNotFound();
            }
            return View(empleadoEspecialidad);
        }

        // POST: EmpleadoEspecialidads/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EmpleadoEspecialidad empleadoEspecialidad = db.EmpleadoEspecialidad.Find(id);
            db.EmpleadoEspecialidad.Remove(empleadoEspecialidad);
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
