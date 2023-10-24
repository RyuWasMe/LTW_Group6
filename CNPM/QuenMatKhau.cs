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
    public partial class frmQuenMatKhau : DevExpress.XtraEditors.XtraForm
    {
        static HangHoaDBContext context = new HangHoaDBContext();
        public TaiKhoan taiKhoan;
        public frmQuenMatKhau()
        {
            InitializeComponent();
        }

        private void btnLayLaiMatKhau_Click(object sender, EventArgs e)
        {
            string email = txtEmailDangKy.Text;

            TaiKhoan taiKhoan = context.TaiKhoans.FirstOrDefault(tk => tk.Email == email);

            if (taiKhoan != null)
            {
                txtMatKhau.Text = taiKhoan.MatKhau;
            }
            else
            {
                MessageBox.Show("Email không tồn tại. Vui lòng nhập lại.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            DialogResult result = MessageBox.Show("Bạn có muốn đổi mật khẩu?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

            if (result == DialogResult.Yes)
            {
                // Tạo và hiển thị form đổi mật khẩu
                frmDoiMatKhau changePassword = new frmDoiMatKhau(taiKhoan);
                changePassword.ShowDialog(); // Sử dụng ShowDialog() để chặn thao tác với cửa sổ chính cho đến khi form đổi mật khẩu được đóng lại
            }
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}