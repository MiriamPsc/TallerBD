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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class InstitutoDeInvestigacionEntities : DbContext
    {
        public InstitutoDeInvestigacionEntities()
            : base("name=InstitutoDeInvestigacionEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Beneficiario> Beneficiario { get; set; }
        public virtual DbSet<Caso> Caso { get; set; }
        public virtual DbSet<Certificado> Certificado { get; set; }
        public virtual DbSet<Departamento> Departamento { get; set; }
        public virtual DbSet<DepartamentoReactivo> DepartamentoReactivo { get; set; }
        public virtual DbSet<Donacion> Donacion { get; set; }
        public virtual DbSet<DonacionInstitucion> DonacionInstitucion { get; set; }
        public virtual DbSet<Empleado> Empleado { get; set; }
        public virtual DbSet<EmpleadoEquipo> EmpleadoEquipo { get; set; }
        public virtual DbSet<EmpleadoEspecialidad> EmpleadoEspecialidad { get; set; }
        public virtual DbSet<EmpleadoInstitucion> EmpleadoInstitucion { get; set; }
        public virtual DbSet<Equipo> Equipo { get; set; }
        public virtual DbSet<Especialidad> Especialidad { get; set; }
        public virtual DbSet<Institucion> Institucion { get; set; }
        public virtual DbSet<InstitucionEducativa> InstitucionEducativa { get; set; }
        public virtual DbSet<Instrumento> Instrumento { get; set; }
        public virtual DbSet<Mobiliario> Mobiliario { get; set; }
        public virtual DbSet<Pase> Pase { get; set; }
        public virtual DbSet<Reactivo> Reactivo { get; set; }
        public virtual DbSet<Reporte> Reporte { get; set; }
        public virtual DbSet<TipoCertificado> TipoCertificado { get; set; }
        public virtual DbSet<TipoEmpleado> TipoEmpleado { get; set; }
        public virtual DbSet<TipoInstitucion> TipoInstitucion { get; set; }
        public virtual DbSet<TipoInstrumento> TipoInstrumento { get; set; }
        public virtual DbSet<TipoMobiliario> TipoMobiliario { get; set; }
        public virtual DbSet<TipoPase> TipoPase { get; set; }
        public virtual DbSet<TipoVisita> TipoVisita { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Visita> Visita { get; set; }
        public virtual DbSet<Visitante> Visitante { get; set; }
    
        public virtual ObjectResult<BeneficiarioDonacion_Result> BeneficiarioDonacion(Nullable<int> idBen)
        {
            var idBenParameter = idBen.HasValue ?
                new ObjectParameter("idBen", idBen) :
                new ObjectParameter("idBen", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<BeneficiarioDonacion_Result>("BeneficiarioDonacion", idBenParameter);
        }
    
        public virtual ObjectResult<DonacionesOrden_Result> DonacionesOrden()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DonacionesOrden_Result>("DonacionesOrden");
        }
    
        public virtual ObjectResult<EmpleadoAños_Result> EmpleadoAños(Nullable<int> idEmpInsti)
        {
            var idEmpInstiParameter = idEmpInsti.HasValue ?
                new ObjectParameter("idEmpInsti", idEmpInsti) :
                new ObjectParameter("idEmpInsti", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EmpleadoAños_Result>("EmpleadoAños", idEmpInstiParameter);
        }
    
        public virtual ObjectResult<EmpleadoPuesto_Result> EmpleadoPuesto()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EmpleadoPuesto_Result>("EmpleadoPuesto");
        }
    
        public virtual ObjectResult<EmpleadoSelectOrden_Result> EmpleadoSelectOrden()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EmpleadoSelectOrden_Result>("EmpleadoSelectOrden");
        }
    
        public virtual ObjectResult<MaximaDonacion_Result> MaximaDonacion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<MaximaDonacion_Result>("MaximaDonacion");
        }
    
        public virtual ObjectResult<MinimaDonacion_Result> MinimaDonacion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<MinimaDonacion_Result>("MinimaDonacion");
        }
    
        public virtual ObjectResult<PrimeraVisitaVisitante_Result> PrimeraVisitaVisitante(Nullable<int> idVis)
        {
            var idVisParameter = idVis.HasValue ?
                new ObjectParameter("idVis", idVis) :
                new ObjectParameter("idVis", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<PrimeraVisitaVisitante_Result>("PrimeraVisitaVisitante", idVisParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> ReactivoSemanas(Nullable<int> idDepReac)
        {
            var idDepReacParameter = idDepReac.HasValue ?
                new ObjectParameter("idDepReac", idDepReac) :
                new ObjectParameter("idDepReac", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("ReactivoSemanas", idDepReacParameter);
        }
    
        public virtual ObjectResult<SelectBeneficiario_Result> SelectBeneficiario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectBeneficiario_Result>("SelectBeneficiario");
        }
    
        public virtual ObjectResult<SelectCaso_Result> SelectCaso()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectCaso_Result>("SelectCaso");
        }
    
        public virtual ObjectResult<SelectCertificado_Result> SelectCertificado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectCertificado_Result>("SelectCertificado");
        }
    
        public virtual ObjectResult<SelectDepartamento_Result> SelectDepartamento()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectDepartamento_Result>("SelectDepartamento");
        }
    
        public virtual ObjectResult<SelectDepartamentoReactivo_Result> SelectDepartamentoReactivo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectDepartamentoReactivo_Result>("SelectDepartamentoReactivo");
        }
    
        public virtual int SelectDonación()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SelectDonación");
        }
    
        public virtual ObjectResult<SelectDonacionInstitucion_Result> SelectDonacionInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectDonacionInstitucion_Result>("SelectDonacionInstitucion");
        }
    
        public virtual ObjectResult<SelectEmpleado_Result> SelectEmpleado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectEmpleado_Result>("SelectEmpleado");
        }
    
        public virtual ObjectResult<SelectEmpleadoEquipo_Result> SelectEmpleadoEquipo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectEmpleadoEquipo_Result>("SelectEmpleadoEquipo");
        }
    
        public virtual ObjectResult<SelectEmpleadoEspecialidad_Result> SelectEmpleadoEspecialidad()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectEmpleadoEspecialidad_Result>("SelectEmpleadoEspecialidad");
        }
    
        public virtual ObjectResult<SelectEmpleadoInstitucion_Result> SelectEmpleadoInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectEmpleadoInstitucion_Result>("SelectEmpleadoInstitucion");
        }
    
        public virtual ObjectResult<SelectEquipo_Result> SelectEquipo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectEquipo_Result>("SelectEquipo");
        }
    
        public virtual ObjectResult<SelectEspecialidad_Result> SelectEspecialidad()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectEspecialidad_Result>("SelectEspecialidad");
        }
    
        public virtual ObjectResult<SelectInstitucion_Result> SelectInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectInstitucion_Result>("SelectInstitucion");
        }
    
        public virtual ObjectResult<SelectInstitucionEducativa_Result> SelectInstitucionEducativa()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectInstitucionEducativa_Result>("SelectInstitucionEducativa");
        }
    
        public virtual ObjectResult<SelectInstrumento_Result> SelectInstrumento()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectInstrumento_Result>("SelectInstrumento");
        }
    
        public virtual ObjectResult<SelectMobiliario_Result> SelectMobiliario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectMobiliario_Result>("SelectMobiliario");
        }
    
        public virtual ObjectResult<SelectPase_Result> SelectPase()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectPase_Result>("SelectPase");
        }
    
        public virtual ObjectResult<SelectReactivo_Result> SelectReactivo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectReactivo_Result>("SelectReactivo");
        }
    
        public virtual ObjectResult<SelectReporte_Result> SelectReporte()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectReporte_Result>("SelectReporte");
        }
    
        public virtual ObjectResult<SelectTipoCertificado_Result> SelectTipoCertificado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoCertificado_Result>("SelectTipoCertificado");
        }
    
        public virtual ObjectResult<SelectTipoEmpleado_Result> SelectTipoEmpleado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoEmpleado_Result>("SelectTipoEmpleado");
        }
    
        public virtual ObjectResult<SelectTipoInstitucion_Result> SelectTipoInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoInstitucion_Result>("SelectTipoInstitucion");
        }
    
        public virtual ObjectResult<SelectTipoInstrumento_Result> SelectTipoInstrumento()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoInstrumento_Result>("SelectTipoInstrumento");
        }
    
        public virtual ObjectResult<SelectTipoMobiliario_Result> SelectTipoMobiliario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoMobiliario_Result>("SelectTipoMobiliario");
        }
    
        public virtual ObjectResult<SelectTipoPase_Result> SelectTipoPase()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoPase_Result>("SelectTipoPase");
        }
    
        public virtual ObjectResult<SelectTipoVisita_Result> SelectTipoVisita()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTipoVisita_Result>("SelectTipoVisita");
        }
    
        public virtual ObjectResult<SelectTodoBeneficiario_Result> SelectTodoBeneficiario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoBeneficiario_Result>("SelectTodoBeneficiario");
        }
    
        public virtual ObjectResult<SelectTodoCaso_Result> SelectTodoCaso()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoCaso_Result>("SelectTodoCaso");
        }
    
        public virtual ObjectResult<SelectTodoCertificado_Result> SelectTodoCertificado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoCertificado_Result>("SelectTodoCertificado");
        }
    
        public virtual ObjectResult<SelectTodoDepartamento_Result> SelectTodoDepartamento()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoDepartamento_Result>("SelectTodoDepartamento");
        }
    
        public virtual ObjectResult<SelectTodoDepartamentoReactivo_Result> SelectTodoDepartamentoReactivo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoDepartamentoReactivo_Result>("SelectTodoDepartamentoReactivo");
        }
    
        public virtual ObjectResult<SelectTodoDonacion_Result> SelectTodoDonacion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoDonacion_Result>("SelectTodoDonacion");
        }
    
        public virtual ObjectResult<SelectTodoDonacionInstitucion_Result> SelectTodoDonacionInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoDonacionInstitucion_Result>("SelectTodoDonacionInstitucion");
        }
    
        public virtual ObjectResult<SelectTodoEmpleado_Result> SelectTodoEmpleado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoEmpleado_Result>("SelectTodoEmpleado");
        }
    
        public virtual ObjectResult<SelectTodoEmpleadoEquipo_Result> SelectTodoEmpleadoEquipo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoEmpleadoEquipo_Result>("SelectTodoEmpleadoEquipo");
        }
    
        public virtual ObjectResult<SelectTodoEmpleadoEspecialidad_Result> SelectTodoEmpleadoEspecialidad()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoEmpleadoEspecialidad_Result>("SelectTodoEmpleadoEspecialidad");
        }
    
        public virtual ObjectResult<SelectTodoEmpleadoInstitucion_Result> SelectTodoEmpleadoInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoEmpleadoInstitucion_Result>("SelectTodoEmpleadoInstitucion");
        }
    
        public virtual ObjectResult<SelectTodoEquipo_Result> SelectTodoEquipo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoEquipo_Result>("SelectTodoEquipo");
        }
    
        public virtual ObjectResult<SelectTodoEspecialidad_Result> SelectTodoEspecialidad()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoEspecialidad_Result>("SelectTodoEspecialidad");
        }
    
        public virtual ObjectResult<SelectTodoInstitucion_Result> SelectTodoInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoInstitucion_Result>("SelectTodoInstitucion");
        }
    
        public virtual ObjectResult<SelectTodoInstitucionEducativa_Result> SelectTodoInstitucionEducativa()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoInstitucionEducativa_Result>("SelectTodoInstitucionEducativa");
        }
    
        public virtual ObjectResult<SelectTodoInstrumento_Result> SelectTodoInstrumento()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoInstrumento_Result>("SelectTodoInstrumento");
        }
    
        public virtual ObjectResult<SelectTodoMobiliario_Result> SelectTodoMobiliario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoMobiliario_Result>("SelectTodoMobiliario");
        }
    
        public virtual ObjectResult<SelectTodoPase_Result> SelectTodoPase()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoPase_Result>("SelectTodoPase");
        }
    
        public virtual ObjectResult<SelectTodoReactivo_Result> SelectTodoReactivo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoReactivo_Result>("SelectTodoReactivo");
        }
    
        public virtual ObjectResult<SelectTodoReporte_Result> SelectTodoReporte()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoReporte_Result>("SelectTodoReporte");
        }
    
        public virtual ObjectResult<SelectTodoTipoCertificado_Result> SelectTodoTipoCertificado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoCertificado_Result>("SelectTodoTipoCertificado");
        }
    
        public virtual ObjectResult<SelectTodoTipoEmpleado_Result> SelectTodoTipoEmpleado()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoEmpleado_Result>("SelectTodoTipoEmpleado");
        }
    
        public virtual ObjectResult<SelectTodoTipoInstitucion_Result> SelectTodoTipoInstitucion()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoInstitucion_Result>("SelectTodoTipoInstitucion");
        }
    
        public virtual ObjectResult<SelectTodoTipoInstrumento_Result> SelectTodoTipoInstrumento()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoInstrumento_Result>("SelectTodoTipoInstrumento");
        }
    
        public virtual ObjectResult<SelectTodoTipoMobiliario_Result> SelectTodoTipoMobiliario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoMobiliario_Result>("SelectTodoTipoMobiliario");
        }
    
        public virtual ObjectResult<SelectTodoTipoPase_Result> SelectTodoTipoPase()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoPase_Result>("SelectTodoTipoPase");
        }
    
        public virtual ObjectResult<SelectTodoTipoVisita_Result> SelectTodoTipoVisita()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoTipoVisita_Result>("SelectTodoTipoVisita");
        }
    
        public virtual ObjectResult<SelectTodoUsuario_Result> SelectTodoUsuario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoUsuario_Result>("SelectTodoUsuario");
        }
    
        public virtual ObjectResult<SelectTodoVisita_Result> SelectTodoVisita()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoVisita_Result>("SelectTodoVisita");
        }
    
        public virtual ObjectResult<SelectTodoVisitante_Result> SelectTodoVisitante()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectTodoVisitante_Result>("SelectTodoVisitante");
        }
    
        public virtual ObjectResult<SelectUsuario_Result> SelectUsuario()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectUsuario_Result>("SelectUsuario");
        }
    
        public virtual ObjectResult<SelectVisita_Result> SelectVisita()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectVisita_Result>("SelectVisita");
        }
    
        public virtual ObjectResult<SelectVisitante_Result> SelectVisitante()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SelectVisitante_Result>("SelectVisitante");
        }
    
        public virtual ObjectResult<Nullable<int>> TotalDonaciones()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("TotalDonaciones");
        }
    
        public virtual ObjectResult<Nullable<int>> TotalEmpleados()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("TotalEmpleados");
        }
    
        public virtual ObjectResult<UltimaVisitaVisitante_Result> UltimaVisitaVisitante(Nullable<int> idVis)
        {
            var idVisParameter = idVis.HasValue ?
                new ObjectParameter("idVis", idVis) :
                new ObjectParameter("idVis", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UltimaVisitaVisitante_Result>("UltimaVisitaVisitante", idVisParameter);
        }
    
        public virtual ObjectResult<VisitantesSelectOrden_Result> VisitantesSelectOrden()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<VisitantesSelectOrden_Result>("VisitantesSelectOrden");
        }
    
        public virtual ObjectResult<VisitanteVisita_Result> VisitanteVisita()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<VisitanteVisita_Result>("VisitanteVisita");
        }
    
        public virtual ObjectResult<VisitasDia_Result> VisitasDia()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<VisitasDia_Result>("VisitasDia");
        }
    }
}
