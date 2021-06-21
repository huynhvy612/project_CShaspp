using ModelEF.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Areas.HuynhVy.Models;
using TestUngDung.Common;

namespace TestUngDung.Controllers
{
    public class LoginClientController : Controller
    {
        // GET: LoginClient
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LoginModel user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                Session["USER_SESSION"] = "";
                var result = dao.login(user.UserID, Encryptor.EncryptMD5(user.Password),"US");
                if (result == 1)
                {
                    //  ModelState.AddModelError("", "Đăng nhập thành công");
                    Session.Add(Common.Constans.USER_SESSION, user.UserID);
                    Session["USER_SESSION"] = user.UserID;
                    return RedirectToAction("Index", "HomeClient");
                }

                else
                {
                    ModelState.AddModelError("", "Đăng nhập không thành công");
                }
                if (Session["USER_SESSION"] == null) return RedirectToAction("Index", "LoginClient");
            }
            return View("Index");
        }
    }
}