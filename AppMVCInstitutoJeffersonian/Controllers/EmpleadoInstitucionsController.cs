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
    public class EmpleadoInstitucionsController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: EmpleadoInstitucions
        public ActionResult Index()
        {
            var empleadoInstitucion = db.EmpleadoInstitucion.Include(e => e.Empleado).Include(e => e.Institucion).Include(e => e.Usuario).Include(e => e.Usuario1);
            return View(empleadoInstitucion.ToList());
        }

        // GET: EmpleadoInstitucions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoInstitucion empleadoInstitucion = db.EmpleadoInstitucion.Find(id);
            if (empleadoInstitucion == null)
            {
                return HttpNotFound();
            }
            return View(empleadoInstitucion);
        }

        // GET: EmpleadoInstitucions/Create
        public ActionResult Create()
        {
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero");
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: EmpleadoInstitucions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEmpleadoInstitucion,idEmpleado,idInstitucion,fechaInicio,fechaFinal,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] EmpleadoInstitucion empleadoInstitucion)
        {
            if (ModelState.IsValid)
            {
                db.EmpleadoInstitucion.Add(empleadoInstitucion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoInstitucion.idEmpleado);
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", empleadoInstitucion.idInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoInstitucion.idUsuarioModifica);
            return View(empleadoInstitucion);
        }

        // GET: EmpleadoInstitucions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoInstitucion empleadoInstitucion = db.EmpleadoInstitucion.Find(id);
            if (empleadoInstitucion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoInstitucion.idEmpleado);
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", empleadoInstitucion.idInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoInstitucion.idUsuarioModifica);
            return View(empleadoInstitucion);
        }

        // POST: EmpleadoInstitucions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEmpleadoInstitucion,idEmpleado,idInstitucion,fechaInicio,fechaFinal,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] EmpleadoInstitucion empleadoInstitucion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleadoInstitucion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoInstitucion.idEmpleado);
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", empleadoInstitucion.idInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoInstitucion.idUsuarioModifica);
            return View(empleadoInstitucion);
        }

        // GET: EmpleadoInstitucions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoInstitucion empleadoInstitucion = db.EmpleadoInstitucion.Find(id);
            if (empleadoInstitucion == null)
            {
                return HttpNotFound();
            }
            return View(empleadoInstitucion);
        }

        // POST: EmpleadoInstitucions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EmpleadoInstitucion empleadoInstitucion = db.EmpleadoInstitucion.Find(id);
            db.EmpleadoInstitucion.Remove(empleadoInstitucion);
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
