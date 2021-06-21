using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelEF;
using ModelEF.DAO;

namespace TestUngDung.Areas.HuynhVy.Controllers
{
    public class HomeController : Controller
    {
        // GET: HuynhVy/Home
        public ActionResult Index()
        {
            if (Session["USER_SESSION"] == null)
                return RedirectToAction("Index", "Login");
            return View();
        }
        public ActionResult Logout()
        {
            Session[Common.Constans.USER_SESSION] = null;
            return RedirectToAction("Index", "Login");
        }


    }
}