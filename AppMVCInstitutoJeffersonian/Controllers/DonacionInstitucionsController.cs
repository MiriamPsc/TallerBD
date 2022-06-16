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
    public class DonacionInstitucionsController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: DonacionInstitucions
        public ActionResult Index()
        {
            var donacionInstitucion = db.DonacionInstitucion.Include(d => d.Donacion).Include(d => d.Institucion).Include(d => d.Usuario).Include(d => d.Usuario1);
            return View(donacionInstitucion.ToList());
        }

        // GET: DonacionInstitucions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonacionInstitucion donacionInstitucion = db.DonacionInstitucion.Find(id);
            if (donacionInstitucion == null)
            {
                return HttpNotFound();
            }
            return View(donacionInstitucion);
        }

        // GET: DonacionInstitucions/Create
        public ActionResult Create()
        {
            ViewBag.idDonacion = new SelectList(db.Donacion, "idDonacion", "idDonacion");
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: DonacionInstitucions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idDonacionInstitucion,idDonacion,idInstitucion,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] DonacionInstitucion donacionInstitucion)
        {
            if (ModelState.IsValid)
            {
                db.DonacionInstitucion.Add(donacionInstitucion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idDonacion = new SelectList(db.Donacion, "idDonacion", "idDonacion", donacionInstitucion.idDonacion);
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", donacionInstitucion.idInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", donacionInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", donacionInstitucion.idUsuarioModifica);
            return View(donacionInstitucion);
        }

        // GET: DonacionInstitucions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonacionInstitucion donacionInstitucion = db.DonacionInstitucion.Find(id);
            if (donacionInstitucion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDonacion = new SelectList(db.Donacion, "idDonacion", "idDonacion", donacionInstitucion.idDonacion);
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", donacionInstitucion.idInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", donacionInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", donacionInstitucion.idUsuarioModifica);
            return View(donacionInstitucion);
        }

        // POST: DonacionInstitucions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idDonacionInstitucion,idDonacion,idInstitucion,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] DonacionInstitucion donacionInstitucion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donacionInstitucion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idDonacion = new SelectList(db.Donacion, "idDonacion", "idDonacion", donacionInstitucion.idDonacion);
            ViewBag.idInstitucion = new SelectList(db.Institucion, "idInstitucion", "nombre", donacionInstitucion.idInstitucion);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", donacionInstitucion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", donacionInstitucion.idUsuarioModifica);
            return View(donacionInstitucion);
        }

        // GET: DonacionInstitucions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonacionInstitucion donacionInstitucion = db.DonacionInstitucion.Find(id);
            if (donacionInstitucion == null)
            {
                return HttpNotFound();
            }
            return View(donacionInstitucion);
        }

        // POST: DonacionInstitucions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DonacionInstitucion donacionInstitucion = db.DonacionInstitucion.Find(id);
            db.DonacionInstitucion.Remove(donacionInstitucion);
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
