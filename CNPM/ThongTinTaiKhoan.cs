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
    public partial class frmThongTinTaiKhoan : DevExpress.XtraEditors.XtraForm
    {
        private TaiKhoan taiKhoan;
        public frmThongTinTaiKhoan(TaiKhoan user)
        {
            InitializeComponent();
            taiKhoan = user;
        }

        private void btnTroLai_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmThongTinTaiKhoan_Load(object sender, EventArgs e)
        {
            txtTenDangNhap.Text = taiKhoan.TenDangNhap;
            txtMatKhau.Text = taiKhoan.MatKhau;
            txtEmail.Text = taiKhoan.Email;
        }
    }
}