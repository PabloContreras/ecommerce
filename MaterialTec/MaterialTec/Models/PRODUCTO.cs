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
    
    public partial class PRODUCTO
    {
        public PRODUCTO()
        {
            this.FACTURA_PRODUCTO = new HashSet<FACTURA_PRODUCTO>();
            this.IMAGEN_PRODUCTO = new HashSet<IMAGEN_PRODUCTO>();
            this.ORDEN_PRODUCTO = new HashSet<ORDEN_PRODUCTO>();
            this.PRODUCTO_PROMOCION = new HashSet<PRODUCTO_PROMOCION>();
        }
    
        public int ID { get; set; }
        public string NOMBRE { get; set; }
        public string DESCRIPCION { get; set; }
        public Nullable<int> CANTIDAD { get; set; }
        public Nullable<double> PRECIO { get; set; }
        public Nullable<int> PUNTO_REORDEN { get; set; }
        public Nullable<System.DateTime> GARANTIA { get; set; }
        public Nullable<int> TIENDA { get; set; }
        public Nullable<int> AUTORIZADO { get; set; }
        public Nullable<double> COSTO { get; set; }
        public Nullable<int> COMPRADO { get; set; }
        public Nullable<int> DESCUENTO { get; set; }
        public int FK_CATEGORIA { get; set; }
        public int FK_ALMACEN { get; set; }
        public int ACTIVO { get; set; }
        public Nullable<System.DateTime> CREATED_AT { get; set; }
    
        public virtual ALMACEN ALMACEN { get; set; }
        public virtual CATEGORIA CATEGORIA { get; set; }
        public virtual ICollection<FACTURA_PRODUCTO> FACTURA_PRODUCTO { get; set; }
        public virtual ICollection<IMAGEN_PRODUCTO> IMAGEN_PRODUCTO { get; set; }
        public virtual ICollection<ORDEN_PRODUCTO> ORDEN_PRODUCTO { get; set; }
        public virtual ICollection<PRODUCTO_PROMOCION> PRODUCTO_PROMOCION { get; set; }
    }
}
