//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MaterialTec.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CATEGORIA
    {
        public CATEGORIA()
        {
            this.PRODUCTOes = new HashSet<PRODUCTO>();
        }
    
        public int ID { get; set; }
        public string NOMBRE { get; set; }
        public int ACTIVO { get; set; }
        public System.DateTime CREATED_AT { get; set; }
    
        public virtual ICollection<PRODUCTO> PRODUCTOes { get; set; }
    }
}
