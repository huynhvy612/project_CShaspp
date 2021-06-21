using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.HuynhVy.Controllers
{
    public class ProductController : BaseController
    {
        // GET: HuynhVy/Product
        HuynhThiThaoVyContext dbVy = new HuynhThiThaoVyContext();
        ProductDAO dao = new ProductDAO();

        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var prd = new ProductDAO();
            var model = prd.ListWhereAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        //create
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Product model)
        {
            if (ModelState.IsValid)
            {
                var id_sp = new ProductDAO();
                if (id_sp.Find(model.ProductID) != null)
                {
                    return RedirectToAction("Create", "Product");
                }

                string result = id_sp.Insert(model);
                if (!string.IsNullOrEmpty(result))
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Tạo sản phẩm không thành công");
                }
            }
            return View(model);
        }

        public void SetViewBag(string selectedId = null)
        {
            var cate = new CategoryDAO();
            ViewBag.type = new SelectList(cate.ListAll(), "CategoryID", "CategoryName", selectedId);
        }
        ////Edit lấy id
        [HttpGet]
        public ActionResult Edit(string id)
        {
            Product sp = dbVy.Products.Where(val => val.ProductID.Contains(id)).Single<Product>();
            SetViewBag();
            return View(sp);
        }

        //////save
        [HttpPost]
        public ActionResult Edit(Product model, string id)
        {
            try
            {
                if (model.Image == null)
                {
                    model.Image = dao.Find(model.ProductID).Image;
                }
                dao.Edit(model);
                SetAlert("Cập nhật thông tin sản phẩm thành công", "success");
                return RedirectToAction("Index", "Product");
            }
            catch
            {
                SetAlert("Cập nhật thông tin không thành công", "warning");
                return RedirectToAction("Index", "Product");
            }
        }


        //////updateAnh
        //public ActionResult UpdateSP(string id)
        //{
        //    Product sp = dbVy.Products.Where(val => val.ProductID == id).Single<Product>();
        //    return View(sp);
        //}

        //[HttpPost]
        //public ActionResult UpdatePic(Product model, string id)
        //{
        //    try
        //    {
        //        Product sp = dbVy.Products.Single(u => u.ProductID == model.ProductID);
        //        sp.Image = model.Image;
        //        dbVy.SaveChanges();
        //        SetAlert("Cập nhật ảnh thành công", "success");
        //        return RedirectToAction("Edit", new { id = model.ProductID });
        //    }
        //    catch
        //    {
        //        return View("Edit", new { id = model.ProductID });
        //    }
        //}

        ////delete

        [HttpDelete]
        public ActionResult Delete(string id)
        {

            new ProductDAO().Delete(id);
            return RedirectToAction("Index");

        }

        public ActionResult Detail(string id)
        {
            Product sp = dbVy.Products.Where(val => val.ProductID.Contains(id)).Single<Product>();
            //SetViewBag();
            return View(sp);
        }


    }
}