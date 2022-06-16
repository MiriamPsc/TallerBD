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
    public class CertificadoesController : Controller
    {
        private InstitutoDeInvestigacionEntities db = new InstitutoDeInvestigacionEntities();

        // GET: Certificadoes
        public ActionResult Index()
        {
            var certificado = db.Certificado.Include(c => c.Empleado).Include(c => c.InstitucionEducativa).Include(c => c.TipoCertificado).Include(c => c.Usuario).Include(c => c.Usuario1);
            return View(certificado.ToList());
        }

        // GET: Certificadoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Certificado certificado = db.Certificado.Find(id);
            if (certificado == null)
            {
                return HttpNotFound();
            }
            return View(certificado);
        }

        // GET: Certificadoes/Create
        public ActionResult Create()
        {
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero");
            ViewBag.idInstitucion = new SelectList(db.InstitucionEducativa, "idInstitucionEducativa", "nombre");
            ViewBag.idTipoCertificado = new SelectList(db.TipoCertificado, "idTipoCertificado", "nombre");
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre");
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre");
            return View();
        }

        // POST: Certificadoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCertificado,codigo,idInstitucion,fecha,ciudad,pais,idTipoCertificado,idEmpleado,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Certificado certificado)
        {
            if (ModelState.IsValid)
            {
                db.Certificado.Add(certificado);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", certificado.idEmpleado);
            ViewBag.idInstitucion = new SelectList(db.InstitucionEducativa, "idInstitucionEducativa", "nombre", certificado.idInstitucion);
            ViewBag.idTipoCertificado = new SelectList(db.TipoCertificado, "idTipoCertificado", "nombre", certificado.idTipoCertificado);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", certificado.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", certificado.idUsuarioModifica);
            return View(certificado);
        }

        // GET: Certificadoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Certificado certificado = db.Certificado.Find(id);
            if (certificado == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", certificado.idEmpleado);
            ViewBag.idInstitucion = new SelectList(db.InstitucionEducativa, "idInstitucionEducativa", "nombre", certificado.idInstitucion);
            ViewBag.idTipoCertificado = new SelectList(db.TipoCertificado, "idTipoCertificado", "nombre", certificado.idTipoCertificado);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", certificado.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", certificado.idUsuarioModifica);
            return View(certificado);
        }

        // POST: Certificadoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCertificado,codigo,idInstitucion,fecha,ciudad,pais,idTipoCertificado,idEmpleado,estatus,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica")] Certificado certificado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(certificado).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEmpleado = new SelectList(db.Empleado, "idEmpleado", "numero", certificado.idEmpleado);
            ViewBag.idInstitucion = new SelectList(db.InstitucionEducativa, "idInstitucionEducativa", "nombre", certificado.idInstitucion);
            ViewBag.idTipoCertificado = new SelectList(db.TipoCertificado, "idTipoCertificado", "nombre", certificado.idTipoCertificado);
            ViewBag.idUsuarioCrea = new SelectList(db.Usuario, "idUsuario", "nombre", certificado.idUsuarioCrea);
            ViewBag.idUsuarioModifica = new SelectList(db.Usuario, "idUsuario", "nombre", certificado.idUsuarioModifica);
            return View(certificado);
        }

        // GET: Certificadoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Certificado certificado = db.Certificado.Find(id);
            if (certificado == null)
            {
                return HttpNotFound();
            }
            return View(certificado);
        }

        // POST: Certificadoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Certificado certificado = db.Certificado.Find(id);
            db.Certificado.Remove(certificado);
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
