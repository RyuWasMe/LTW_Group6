using CNPM.Models;
using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CNPM
{
    public partial class frmDoiMatKhau : DevExpress.XtraEditors.XtraForm
    {
        static HangHoaDBContext context = new HangHoaDBContext();
        public TaiKhoan taiKhoan;
        public frmDoiMatKhau(TaiKhoan loggedInUser)
        {
            InitializeComponent();
            taiKhoan = loggedInUser;
        }

        private void btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra xem có đủ thông tin trong các ô trống
                if (string.IsNullOrEmpty(txtOldPass.Text) || string.IsNullOrEmpty(txtNewPass.Text) || string.IsNullOrEmpty(txtNewPass2.Text))
                {
                    MessageBox.Show("Vui lòng nhập đủ thông tin!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return; // Không thực hiện thay đổi mật khẩu nếu thiếu thông tin
                }

                if (txtOldPass.Text == taiKhoan.MatKhau)
                {
                    if (txtNewPass.Text == txtNewPass2.Text)
                    {
                        lbVerify.ForeColor = System.Drawing.Color.Green;
                        lbVerify.Text = "Mật khẩu trùng khớp";

                        taiKhoan.MatKhau = txtNewPass.Text;
                        context.Entry(taiKhoan).State = EntityState.Modified; // Đánh dấu rằng đối tượng đã thay đổi
                        context.SaveChanges();

                        MessageBox.Show("Đổi mật khẩu thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.Close();

                    }
                    else
                    {
                        lbVerify.ForeColor = System.Drawing.Color.Red;
                        lbVerify.Text = "Mật khẩu chưa khớp";
                        MessageBox.Show("Mật khẩu mới chưa khớp! Vui lòng nhập lại mật khẩu mới.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    MessageBox.Show("Mật khẩu đã nhập không khớp với mật khẩu cũ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Đã xảy ra lỗi trong quá trình đổi mật khẩu: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}