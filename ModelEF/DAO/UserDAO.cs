using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class UserDAO
    {
        private HuynhThiThaoVyContext db;
        public UserDAO()
        {
            db = new HuynhThiThaoVyContext();
        }
        public int login(string UserID, string Password, string Permision)
        {
            var result = db.UserAccounts.SingleOrDefault(x => x.UserID.Contains(UserID) && x.Password.Contains(Password) && x.Permission.Contains(Permision) && x.Status.Contains("Active"));
            if (result == null)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        public UserAccount Find(string UserID)
        {
            return db.UserAccounts.Find(UserID);
        }

        public bool Delete(string UserID)
        {
            try
            {
                var prd = db.UserAccounts.Find(UserID);
                db.UserAccounts.Remove(prd);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<UserAccount> ListAll()
        {
            return db.UserAccounts.ToList();
        }

        public IEnumerable<UserAccount> ListWhereAll(string searchString, int page, int pageSize)
        {
            IQueryable<UserAccount> model = (from s in db.UserAccounts where s.Permission.Contains("US") orderby s.UserID ascending select s);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserID.Contains(searchString) || x.UserName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.UserID).ToPagedList(page, pageSize);
        }


    }
}