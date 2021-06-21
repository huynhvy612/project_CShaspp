using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Areas.HuynhVy.Models;
using ModelEF.DAO;
using TestUngDung.Common;

namespace TestUngDung.Areas.HuynhVy.Controllers
{
    public class LoginController : Controller
    {
        // GET: HuynhVy/Login
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
                var userdao = new UserDAO();
                var result = userdao.login(user.UserID, Encryptor.EncryptMD5(user.Password),"AD");
                if (result == 1)
                {
                    // ModelState.AddModelError("", "Đăng nhập thành công");
                    Session.Add(Common.Constans.USER_SESSION, user.UserID);
                    Session["USER_SESSION"] = user.UserID;
                    return RedirectToAction("Index", "Home");
                }
                else
                {

                    ModelState.AddModelError("", "Đăng nhập không thành công");
                } 
            }
            return View("Index");
        }
    }


}