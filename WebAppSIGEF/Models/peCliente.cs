//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAppSIGEF.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class peCliente
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public peCliente()
        {
            this.caSolitudCaptacion = new HashSet<caSolitudCaptacion>();
            this.mcTransaccion = new HashSet<mcTransaccion>();
            this.acCajaAhorro = new HashSet<acCajaAhorro>();
            this.acDPF = new HashSet<acDPF>();
            this.acTarjetaDebito = new HashSet<acTarjetaDebito>();
        }
    
        public int iCliente_id { get; set; }
        public string sCliente_nombre { get; set; }
        public string sCliente_apellido { get; set; }
        public string sCliente_ci { get; set; }
        public string sCliente_telf { get; set; }
        public Nullable<int> iCliente_discriminador { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<caSolitudCaptacion> caSolitudCaptacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<mcTransaccion> mcTransaccion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<acCajaAhorro> acCajaAhorro { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<acDPF> acDPF { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<acTarjetaDebito> acTarjetaDebito { get; set; }
    }
}
