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
    public class ReportesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Reportes
        public ActionResult Index()
        {
            var reporte = db.Reporte.Include(r => r.Caso).Include(r => r.Empleado).Include(r => r.Empleado1).Include(r => r.Usuario).Include(r => r.Usuario1);
            return View(reporte.ToList());
        }

        // GET: Reportes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporte reporte = db.Reporte.Find(id);
            if (reporte == null)
            {
                return HttpNotFound();
            }
            return View(reporte);
        }

        // GET: Reportes/Create
        public ActionResult Create()
        {
            ViewBag.idCaso = new SelectList(db.Caso, "idCaso", "codigo");
            ViewBag.idEmpleadoEntrega = new SelectList(db.Empleado, "idEmpleado", "numero");
            ViewBag.idEmpleadoRecibe = new SelectList(db.Empleado, "idEmpleado", "numero");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Reportes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idReporte,codigo,idCaso,fechaEntrega,idEmpleadoEntrega,idEmpleadoRecibe,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Reporte reporte)
        {
            if (ModelState.IsValid)
            {
                db.Reporte.Add(reporte);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCaso = new SelectList(db.Caso, "idCaso", "codigo", reporte.idCaso);
            ViewBag.idEmpleadoEntrega = new SelectList(db.Empleado, "idEmpleado", "numero", reporte.idEmpleadoEntrega);
            ViewBag.idEmpleadoRecibe = new SelectList(db.Empleado, "idEmpleado", "numero", reporte.idEmpleadoRecibe);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", reporte.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", reporte.idUsuarioModifica);
            return View(reporte);
        }

        // GET: Reportes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporte reporte = db.Reporte.Find(id);
            if (reporte == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCaso = new SelectList(db.Caso, "idCaso", "codigo", reporte.idCaso);
            ViewBag.idEmpleadoEntrega = new SelectList(db.Empleado, "idEmpleado", "numero", reporte.idEmpleadoEntrega);
            ViewBag.idEmpleadoRecibe = new SelectList(db.Empleado, "idEmpleado", "numero", reporte.idEmpleadoRecibe);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", reporte.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", reporte.idUsuarioModifica);
            return View(reporte);
        }

        // POST: Reportes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idReporte,codigo,idCaso,fechaEntrega,idEmpleadoEntrega,idEmpleadoRecibe,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Reporte reporte)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reporte).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCaso = new SelectList(db.Caso, "idCaso", "codigo", reporte.idCaso);
            ViewBag.idEmpleadoEntrega = new SelectList(db.Empleado, "idEmpleado", "numero", reporte.idEmpleadoEntrega);
            ViewBag.idEmpleadoRecibe = new SelectList(db.Empleado, "idEmpleado", "numero", reporte.idEmpleadoRecibe);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", reporte.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", reporte.idUsuarioModifica);
            return View(reporte);
        }

        // GET: Reportes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reporte reporte = db.Reporte.Find(id);
            if (reporte == null)
            {
                return HttpNotFound();
            }
            return View(reporte);
        }

        // POST: Reportes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reporte reporte = db.Reporte.Find(id);
            db.Reporte.Remove(reporte);
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
