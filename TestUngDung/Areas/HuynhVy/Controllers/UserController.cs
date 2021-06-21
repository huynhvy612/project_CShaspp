using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Common;

namespace TestUngDung.Areas.HuynhVy.Controllers
{
    public class UserController : BaseController
    {
        HuynhThiThaoVyContext dbVy = new HuynhThiThaoVyContext();
        // GET: HuynhVy/User

        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var user = new UserDAO();
            var model = user.ListWhereAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        //thay doi status
        public ActionResult Edit(string id)
        {
            try
            {
                UserAccount user = dbVy.UserAccounts.Where(val => val.UserID == id).Single<UserAccount>();
                if (user.Status == "Blocked")
                {
                    user.Status = "Active";
                    SetAlert("Kích hoạt tài khoản thành công", "success");
                }
                else
                {
                    user.Status = "Blocked";
                    SetAlert("Đã vô hiệu hoá tài khoản", "warning");
                }
                dbVy.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //xoa us la blocked , act thi chuyen ve blocked moi duoc xoa
        [HttpDelete]
        public ActionResult Delete(string id)
        {
            UserAccount user = dbVy.UserAccounts.Where(val => val.UserID == id).Single<UserAccount>();
            if (user.Status == "Blocked")
            {
                new UserDAO().Delete(id);
                SetAlert("Xoá tài khoản thành công", "success");
                dbVy.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                SetAlert("Tài khoản còn hoạt động, chưa thể xoá", "warning");
            }

            dbVy.SaveChanges();
            return RedirectToAction("Index");

        }


    }
}