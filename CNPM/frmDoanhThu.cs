using CNPM.Models;
using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CNPM
{
    public partial class frmDoanhThu : DevExpress.XtraEditors.XtraForm
    {
        public HangHoaDBContext context = new HangHoaDBContext();
        List<Doanh_Thu> thuList = new List<Doanh_Thu>();
        public frmDoanhThu()
        {
            InitializeComponent();
        }
        private void frmDoanhThu_Load(object sender, EventArgs e)
        {
            thuList = context.Doanh_Thus.ToList();
            double tonggiagoc = 0;
            double tonggiaban = 0;
            foreach (var item in thuList)
            {
                tonggiagoc += item.Tổng_Giá_Gốc;
                tonggiaban += item.Tổng_Giá_Bán;
            }
            lbTongTienNhap.Text = tonggiagoc.ToString();
            lbTongTienBan.Text = tonggiaban.ToString();
            lbTongDoanhThu.Text = (tonggiaban - tonggiagoc).ToString();
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
           context.Doanh_Thus.RemoveRange(context.Doanh_Thus);
            context.SaveChanges();
            lbTongTienNhap.Text =
            lbTongTienBan.Text =
            lbTongDoanhThu.Text = "0";
            MessageBox.Show("Đã làm mới");   
        }
    }
}