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
    
    public partial class caSolitudCaptacion
    {
        public int iSolitudCaptacion_id { get; set; }
        public System.DateTime dtSolitudCaptacion_fecha { get; set; }
        public string sSolitudCaptacion_desc { get; set; }
        public int iPAC_id { get; set; }
        public int iCliente_id { get; set; }
        public int iSolicitudCaptacion_discriminador { get; set; }
        public short iSolicitudCaptacion_estado { get; set; }
    
        public virtual caPAC caPAC { get; set; }
        public virtual peCliente peCliente { get; set; }
    }
}