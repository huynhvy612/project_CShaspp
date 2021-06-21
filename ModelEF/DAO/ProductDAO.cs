using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class ProductDAO
    {
        private HuynhThiThaoVyContext db;

        public ProductDAO()
        {
            db = new HuynhThiThaoVyContext();
        }

        public string Insert(Product entitySanPham)
        {
            db.Products.Add(entitySanPham);
            db.SaveChanges();
            return entitySanPham.ProductID;
        }

        public Product Find(string ProductID)
        {
            return db.Products.Find(ProductID);
        }

        public void Edit(Product entity)
        {
            var result = db.Products.Where(x => x.ProductID.Contains(entity.ProductID)).FirstOrDefault();
            db.Entry(result).CurrentValues.SetValues(entity);
            db.SaveChanges();
        }
        public bool Delete(string id)
        {
            try
            {
                var prd = db.Products.Find(id);
                db.Products.Remove(prd);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<Product> ListAll()
        {
            return db.Products.ToList();
        }

        public List<Product> ListDetail(string id)
        {
            return db.Products.Where(x => x.ProductID.Contains(id)).ToList();
        }

        public IEnumerable<Product> ListWhereAll(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = (from sl in db.Products orderby sl.Quantity ascending orderby sl.UnitCost descending select sl);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ProductID.Contains(searchString) || x.ProductName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.Quantity).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListAllClient(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = (from sl in db.Products orderby sl.Quantity ascending select sl);
            if (!string.IsNullOrEmpty(searchString))
            {
                //  model = model.Where(x => x.CategoryID.Contains(categogy));
                model = model.Where(x => x.ProductID.Contains(searchString) || x.ProductName.Contains(searchString));
                //  //  model = model.Where(x => x.CategoryID.Contains(categogy));
            }
            return model.OrderByDescending(x => x.Quantity).ToPagedList(page, pageSize);
        }


    }
}