using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TestUngDung.Areas.HuynhVy.Controllers
{
    public class BaseController : Controller
    {
        // GET: HuynhVy/Base
       
    protected override void OnActionExecuting(ActionExecutingContext filterContext)
    {

        if (Session["USER_SESSION"] == null)
        {

                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Index", Area = "HuynhVy" }));
            }
        base.OnActionExecuting(filterContext);
    }

    protected void SetAlert(string message, string type)
    {
        TempData["AlertMessage"] = message;
        if (type == "success")
        {
            TempData["AlertType"] = "alert-success";
        }
        if (type == "warning")
        {
            TempData["AlertType"] = "alert-warning";
        }
        if (type == "error")
        {
            TempData["AlertType"] = "alert-error";
        }
    }
}
}