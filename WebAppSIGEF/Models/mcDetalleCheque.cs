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
    
    public partial class mcDetalleCheque
    {
        public int iDetalleCheque_id { get; set; }
        public string sDetalleCheque_num { get; set; }
        public string sDetalleCheque_banco { get; set; }
        public string sDetalleCheque_nombre { get; set; }
        public Nullable<int> iTransaccion_id { get; set; }
    
        public virtual mcTransaccion mcTransaccion { get; set; }
    }
}
