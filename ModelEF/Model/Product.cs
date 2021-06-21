namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [StringLength(50)]
        [DisplayFormat(NullDisplayText ="Không được để trống!")]
        [DisplayName("Mã sản phẩm")]
        public string ProductID { get; set; }

        [StringLength(255)]
        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }

        [DisplayName("Đơn giá")]
        public decimal? UnitCost { get; set; }

        [DisplayName("Số lượng")]
        public int? Quantity { get; set; }

        [DisplayName("Hình ảnh")]
        [StringLength(50)]
        public string Image { get; set; }

        [DisplayName("Mã loại")]
        [StringLength(50)]
        public string CategoryID { get; set; }

        [DisplayName("Mô tả")]
        [StringLength(255)]
        public string Description { get; set; }

        [DisplayName("Tình trạng")]
        [StringLength(50)]
        public string Status { get; set; }

        public virtual Category Category { get; set; }
    }
}
