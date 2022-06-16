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
    public class DonacionsController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Donacions
        public ActionResult Index()
        {
            var donacion = db.Donacion.Include(d => d.Beneficiario).Include(d => d.Usuario).Include(d => d.Usuario1);
            return View(donacion.ToList());
        }

        // GET: Donacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donacion donacion = db.Donacion.Find(id);
            if (donacion == null)
            {
                return HttpNotFound();
            }
            return View(donacion);
        }

        // GET: Donacions/Create
        public ActionResult Create()
        {
            ViewBag.idBeneficiario = new SelectList(db.Beneficiario, "idBeneficiario", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Donacions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idDonacion,fecha,valor,idBeneficiario,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Donacion donacion)
        {
            if (ModelState.IsValid)
            {
                db.Donacion.Add(donacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idBeneficiario = new SelectList(db.Beneficiario, "idBeneficiario", "nombre", donacion.idBeneficiario);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", donacion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", donacion.idUsuarioModifica);
            return View(donacion);
        }

        // GET: Donacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donacion donacion = db.Donacion.Find(id);
            if (donacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.idBeneficiario = new SelectList(db.Beneficiario, "idBeneficiario", "nombre", donacion.idBeneficiario);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", donacion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", donacion.idUsuarioModifica);
            return View(donacion);
        }

        // POST: Donacions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idDonacion,fecha,valor,idBeneficiario,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Donacion donacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idBeneficiario = new SelectList(db.Beneficiario, "idBeneficiario", "nombre", donacion.idBeneficiario);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", donacion.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", donacion.idUsuarioModifica);
            return View(donacion);
        }

        // GET: Donacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donacion donacion = db.Donacion.Find(id);
            if (donacion == null)
            {
                return HttpNotFound();
            }
            return View(donacion);
        }

        // POST: Donacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Donacion donacion = db.Donacion.Find(id);
            db.Donacion.Remove(donacion);
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
