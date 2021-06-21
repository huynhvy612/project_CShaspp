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
    public class CategoryController : BaseController
    {
        // GET: HuynhVy/Category

        HuynhThiThaoVyContext dbVy = new HuynhThiThaoVyContext();

         CategoryDAO dao = new CategoryDAO();

       
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var cate = new CategoryDAO();
            var model = cate.ListWhereAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);

           
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Category model)
        {
            if (ModelState.IsValid)
            {
                var cate = new CategoryDAO();
                if (cate.Find(model.CategoryID) != null)
                {
                    return RedirectToAction("Create", "Category");
                }
               
                string result = cate.Insert(model);
                if (!string.IsNullOrEmpty(result))
                {
                    SetAlert("Thêm loại sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Category");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm loại sản phẩm không thành công");
                    SetAlert("thêm loại sản phẩm không thành công", "warnning");
                }
            }
            return View(model);
        }

        public ActionResult Edit(string cateid)
        {
            var prd = dao.Find(cateid);
            return View(prd);
        }

        //save
        [HttpPost]
        public ActionResult Edit(Category model, string cateid)
        {
            try
            {
               
                dao.Edit(model);
               SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index", "Category");
            }
            catch
            {
                SetAlert("Cập nhật không thành công", "warning");
                return RedirectToAction("Index", "Category");
            }
        }

        public ActionResult UpdateSP(string id)
        {
            Category sp = dbVy.Categories.Where(val => val.CategoryID == id).Single<Category>();

            return View(sp);
        }
      
    }
}