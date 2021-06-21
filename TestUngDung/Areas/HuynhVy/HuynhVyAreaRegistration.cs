using System.Web.Mvc;

namespace TestUngDung.Areas.HuynhVy
{
    public class HuynhVyAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "HuynhVy";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "HuynhVy_default",
                "HuynhVy/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}