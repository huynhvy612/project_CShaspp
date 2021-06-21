using ModelEF.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Common;

namespace TestUngDung.Controllers
{
    public class HomeClientController : Controller
    {
        // GET: HomeClient
        public ActionResult Index(string keysearch, int page = 1, int pagesize = 8)
        {
            var sp = new ProductDAO();
            var model = sp.ListWhereAll(keysearch, page, pagesize);
            return View(model);
        }

        public ActionResult Logout()
        {
            Session[Constans.USER_SESSION] = null;
            return RedirectToAction("Index", "Login");
        }
    }
}