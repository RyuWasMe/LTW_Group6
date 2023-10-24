namespace CNPM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Doanh Thu")]
    public partial class Doanh_Thu
    {
        [Key]
        [Column("Mã Doanh Thu")]
        [StringLength(10)]
        public string Mã_Doanh_Thu { get; set; }

        [Column("Tổng Giá Gốc")]
        public double Tổng_Giá_Gốc { get; set; }

        [Column("Tổng Giá Bán")]
        public double Tổng_Giá_Bán { get; set; }
    }
}
