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
    public class EmpleadoEquipoesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: EmpleadoEquipoes
        public ActionResult Index()
        {
            var empleadoEquipo = db.EmpleadoEquipo.Include(e => e.Empleado).Include(e => e.Equipo).Include(e => e.Usuario).Include(e => e.Usuario1);
            return View(empleadoEquipo.ToList());
        }

        // GET: EmpleadoEquipoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoEquipo empleadoEquipo = db.EmpleadoEquipo.Find(id);
            if (empleadoEquipo == null)
            {
                return HttpNotFound();
            }
            return View(empleadoEquipo);
        }

        // GET: EmpleadoEquipoes/Create
        public ActionResult Create()
        {
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero");
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: EmpleadoEquipoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEmpleadoEquipo,idEmpleado,idEquipo,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] EmpleadoEquipo empleadoEquipo)
        {
            if (ModelState.IsValid)
            {
                db.EmpleadoEquipo.Add(empleadoEquipo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoEquipo.idEmpleado);
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo", empleadoEquipo.idEquipo);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEquipo.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEquipo.idUsuarioModifica);
            return View(empleadoEquipo);
        }

        // GET: EmpleadoEquipoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoEquipo empleadoEquipo = db.EmpleadoEquipo.Find(id);
            if (empleadoEquipo == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoEquipo.idEmpleado);
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo", empleadoEquipo.idEquipo);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEquipo.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEquipo.idUsuarioModifica);
            return View(empleadoEquipo);
        }

        // POST: EmpleadoEquipoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEmpleadoEquipo,idEmpleado,idEquipo,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] EmpleadoEquipo empleadoEquipo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleadoEquipo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", empleadoEquipo.idEmpleado);
            ViewBag.idEquipo = new SelectList(db.Equipo, "idEquipo", "codigo", empleadoEquipo.idEquipo);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEquipo.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", empleadoEquipo.idUsuarioModifica);
            return View(empleadoEquipo);
        }

        // GET: EmpleadoEquipoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmpleadoEquipo empleadoEquipo = db.EmpleadoEquipo.Find(id);
            if (empleadoEquipo == null)
            {
                return HttpNotFound();
            }
            return View(empleadoEquipo);
        }

        // POST: EmpleadoEquipoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EmpleadoEquipo empleadoEquipo = db.EmpleadoEquipo.Find(id);
            db.EmpleadoEquipo.Remove(empleadoEquipo);
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
