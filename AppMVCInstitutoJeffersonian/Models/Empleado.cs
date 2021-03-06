//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppMVCInstitutoJeffersonian.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Empleado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Empleado()
        {
            this.Certificado = new HashSet<Certificado>();
            this.EmpleadoEquipo = new HashSet<EmpleadoEquipo>();
            this.EmpleadoEspecialidad = new HashSet<EmpleadoEspecialidad>();
            this.EmpleadoInstitucion = new HashSet<EmpleadoInstitucion>();
            this.Reporte = new HashSet<Reporte>();
            this.Reporte1 = new HashSet<Reporte>();
        }
    
        public int idEmpleado { get; set; }
        public string numero { get; set; }
        public string nombre { get; set; }
        public string apellidoPaterno { get; set; }
        public string apellidoMaterno { get; set; }
        public string genero { get; set; }
        public string ciudad { get; set; }
        public string pais { get; set; }
        public System.DateTime fechaNacimiento { get; set; }
        public string rfc { get; set; }
        public string dni { get; set; }
        public int idTipoEmpleado { get; set; }
        public Nullable<bool> estatus { get; set; }
        public Nullable<int> idUsuarioCrea { get; set; }
        public Nullable<System.DateTime> fechaCrea { get; set; }
        public Nullable<int> idUsuarioModifica { get; set; }
        public Nullable<System.DateTime> fechaModifica { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Certificado> Certificado { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmpleadoEquipo> EmpleadoEquipo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmpleadoEspecialidad> EmpleadoEspecialidad { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmpleadoInstitucion> EmpleadoInstitucion { get; set; }
        public virtual TipoEmpleado TipoEmpleado { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario Usuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reporte> Reporte { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reporte> Reporte1 { get; set; }
    }
}
