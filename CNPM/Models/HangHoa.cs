namespace CNPM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HangHoa")]
    public partial class HangHoa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HangHoa()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }

        [Key]
        [StringLength(6)]
        public string MaHH { get; set; }

        [Required]
        [StringLength(50)]
        public string TenHH { get; set; }

        public int SL { get; set; }

        [Required]
        [StringLength(6)]
        public string DVT { get; set; }

        public double Gia { get; set; }

        [Required]
        [StringLength(6)]
        public string MaNCC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }

        public virtual TonKho TonKho { get; set; }
    }
}
