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
    public partial class ThemXoaHang : DevExpress.XtraEditors.XtraForm
    {
        public InputChecker Checker = new InputChecker();
        public ThemXoaHang()
        {
            InitializeComponent();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            Close();
        }
        /*
        //Hàm kiểm tra tên mặt hàng đã có tên trong danh sách hay chưa
        private int GetSelectedRow(string TenKH)//sửa
        {
            for (int i = 0; i < dgvDanhSachKhachHang.Rows.Count; i++)//sửa
            {
                if (dgvDanhSachKhachHang.Rows[i].Cells[0].Value.ToString() == TenKH)//sửa
                {
                    return i;
                }
            }
            return -1;
        }*/
        //Sự kiện cập nhật
        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if(txtDonGia.Text == "" & txtSoLuong.Text == "" & txtTenMatHang.Text == "")
            {
                MessageBox.Show("Cần nhập đầy đủ thông tin mặt hàng", "Thông báo");
            }
            else
            {
                /*int selectedRow = GetSelectedRow(txtTenKH.Text);//sửa
                if (selectedRow == -1)
                {
                    MessageBox.Show("Khách hàng hiện không có tên trong danh sách", "Thông báo");
                }
                else
                {

                }*/
            }
        }

        private void txtTenMatHang_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.StringChecker(e.KeyChar.ToString()))
                    e.Handled = true;
        }

        private void txtDonGia_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.CheckNumString(e.KeyChar.ToString()))
                    e.Handled = true;
        }

        private void txtSoLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.CheckNumString(e.KeyChar.ToString()))
                    e.Handled = true;
        }
    }
}