namespace CNPM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TonKho")]
    public partial class TonKho
    {
        [Key]
        [StringLength(6)]
        public string MaHH { get; set; }

        public double GiaNhapHang { get; set; }

        public virtual HangHoa HangHoa { get; set; }
    }
}
