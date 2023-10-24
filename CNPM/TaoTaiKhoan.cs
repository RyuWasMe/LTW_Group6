using CNPM.Models;
using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CNPM
{
    public partial class frmTaoTaiKhoan : DevExpress.XtraEditors.XtraForm
    {
        static HangHoaDBContext context = new HangHoaDBContext();
        public frmTaoTaiKhoan()
        {
            InitializeComponent();
        }

        private void btnQuayLai_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private bool EmailHopLe(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void btnTaoTaiKhoan_Click(object sender, EventArgs e)
        {
            try
            {
                // Lấy thông tin từ các textbox
                string tenDangNhap = txtTenDangNhap.Text;
                string matKhau = txtNhapMatKhau.Text;
                string nhapLaiMatKhau = txtNhapLaiMatKhau.Text;
                string email = txtEmail.Text;

                // Kiểm tra xem các trường thông tin đã được điền đầy đủ
                if (string.IsNullOrEmpty(tenDangNhap) || string.IsNullOrEmpty(matKhau) || string.IsNullOrEmpty(nhapLaiMatKhau) || string.IsNullOrEmpty(email))
                {
                    MessageBox.Show("Vui lòng nhập đầy đủ thông tin.");
                    return;
                }

                // Kiểm tra xem mật khẩu và nhập lại mật khẩu có khớp không
                if (matKhau != nhapLaiMatKhau)
                {
                    MessageBox.Show("Mật khẩu và nhập lại mật khẩu không khớp. Vui lòng kiểm tra lại.");
                    return;
                }

                // Kiểm tra xem email có đúng định dạng không (có chứa dấu @ và tên miền)
                if (!EmailHopLe(email))
                {
                    MessageBox.Show("Email không hợp lệ. Vui lòng kiểm tra lại.");
                    return;
                }


                // Kiểm tra xem tên đăng nhập đã tồn tại trong cơ sở dữ liệu chưa
                if (context.TaiKhoans.Any(tk => tk.TenDangNhap == tenDangNhap))
                {
                    MessageBox.Show("Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.");
                    return;
                }

                // Tạo mới một tài khoản
                TaiKhoan taiKhoan = new TaiKhoan
                {
                    TenDangNhap = tenDangNhap,
                    MatKhau = matKhau,
                    Email = email
                };

                // Thêm tài khoản vào bảng TaiKhoan
                context.TaiKhoans.Add(taiKhoan);
                context.SaveChanges(); // Lưu thay đổi vào cơ sở dữ liệu

                MessageBox.Show("Tạo tài khoản thành công. Bạn có thể sử dụng tài khoản này để đăng nhập.");

                // Đóng form tạo tài khoản sau khi tạo thành công
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi trong quá trình tạo tài khoản. Vui lòng thử lại sau.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
