using CNPM.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CNPM
{
    public partial class DangNhap : DevExpress.XtraEditors.XtraForm
    {
        static HangHoaDBContext context = new HangHoaDBContext();
        public DangNhap()
        {
            InitializeComponent();
            txtTenTaiKhoan.MaxLength = 30;
            txtMatKhauu.MaxLength = 30;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn thoát hay không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (tb == DialogResult.OK)
            {
                Application.Exit();
            }
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            try
            {
                string tenDangNhap = txtTenTaiKhoan.Text;
                string matKhau = txtMatKhauu.Text;

                var taiKhoan = context.TaiKhoans.FirstOrDefault(tk => tk.TenDangNhap == tenDangNhap && tk.MatKhau == matKhau);

                if (taiKhoan != null)
                {
                    frmQLBH hangHoa = new frmQLBH(taiKhoan);
                    hangHoa.Show();
                    this.Hide(); // Ẩn form đăng nhập
                    hangHoa.DangXuat += HangHoa_DangXuat; ;
                    MessageBox.Show("Đăng nhập thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Có thể bạn đã nhập sai thông tin hoặc chưa nhập thông tin", "Vui lòng nhập đúng thông tin", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi kết nối");
            }

            txtTenTaiKhoan.Text = "";
            txtMatKhauu.Text = "";
        }

        private void HangHoa_DangXuat(object sender, EventArgs e)
        {
            (sender as frmQLBH).isThoat = false;
            (sender as frmQLBH).Close();
            this.Show();
        }

        private void cbxHienThiMatKhau_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxHienThiMatKhau.Checked)
            {
                txtMatKhauu.PasswordChar = (char)0;
            }
            else
            {
                txtMatKhauu.PasswordChar = '*';
            }
        }

        private void btnThoat_Click_1(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn thoát hay không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (tb == DialogResult.OK)
            {
                Application.Exit();
            }
        }

        private void lblDangKy_Click(object sender, EventArgs e)
        {
            frmTaoTaiKhoan dangKy = new frmTaoTaiKhoan();
            dangKy.FormClosed += DangKy_FormClosed;
            this.Hide();
            dangKy.Show();
        }

        private void DangKy_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Show();
        }

        private void lblQuenMatKhau_Click(object sender, EventArgs e)
        {

            frmQuenMatKhau quenMatKhau = new frmQuenMatKhau();
            quenMatKhau.FormClosed += QuenMatKhau_FormClosed; ;
            this.Hide();
            quenMatKhau.Show();
        }

        private void QuenMatKhau_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Show();
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {

        }
    }
}
