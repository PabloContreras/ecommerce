using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MaterialTec.Controllers.Administracion
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View("../Admin/Product/Index");
        }

        public ActionResult Test()
        {
            return View("../Admin/Product/Test");
        }
    }
}