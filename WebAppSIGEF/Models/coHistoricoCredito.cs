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
    
    public partial class coHistoricoCredito
    {
        public int iHistoricoCredito_id { get; set; }
        public int iSolicitudCredito_id { get; set; }
        public System.DateTime dtHistoricoCredito_cierre { get; set; }
        public System.DateTime dtHistoricoCredito_ultimaCuota { get; set; }
    
        public virtual coCredito coCredito { get; set; }
    }
}
