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
    
    public partial class DEVOLUCION_PEDIDO
    {
        public int ID { get; set; }
        public int CANTIDAD { get; set; }
        public string RAZON { get; set; }
        public System.DateTime CRATED_AT { get; set; }
        public int FK_PEDIDO_PROVEEDOR { get; set; }
        public int FK_PRODUCTO_PEDIDO { get; set; }
    
        public virtual PEDIDO_PROVEEDOR PEDIDO_PROVEEDOR { get; set; }
        public virtual PRODUCTO_PEDIDO PRODUCTO_PEDIDO { get; set; }
    }
}
