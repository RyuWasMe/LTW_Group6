using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using CNPM.Models;

namespace CNPM
{
    public partial class frmKhoHang : DevExpress.XtraEditors.XtraForm
    {
        public HangHoaDBContext context = new HangHoaDBContext();
        public InputChecker Checker = new InputChecker();
        
        public frmKhoHang()
        {
            InitializeComponent();
        }
        //Load hàng tồn lên datagridview khi mở form
        private void frmKhoHang_Load(object sender, EventArgs e)
        {
            List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList(); //lấy nhà cung cấp
            List<TonKho> listHangTon = context.TonKhoes.ToList(); //láy hàng tồn
            FillFalcultyCombobox(listNhaCungCap);
            BindGrid(listHangTon);
        }
        //hàm reset về giá trị mặc định
        public void resetNull()
        {
            txtMaHT.Text = txtTenHT.Text = txtDVT.Text = txtGiaNhapHang.Text = txtSLNhap.Text = txtGiaBan.Text = string.Empty;
            cbxNhaCungCap.SelectedIndex = 0;
        }
        //Hàm binding list có tên là tên nhà cung cấp, giá trị là Mã nhà cung cấp
        private void FillFalcultyCombobox(List<NhaCungCap> listNhaCungCap)
        {
            this.cbxNhaCungCap.DataSource = listNhaCungCap;
            this.cbxNhaCungCap.DisplayMember = "TenNCC";
            this.cbxNhaCungCap.ValueMember = "MaNCC";
        }
        //Hàm binding gridView list hàng tồn
        private void BindGrid(List<TonKho> listHangTon)
        {
            dgvHangHoa.Rows.Clear();
            foreach (var item in listHangTon)
            {
                int index = dgvHangHoa.Rows.Add();
                dgvHangHoa.Rows[index].Cells[0].Value = item.MaHH;
                dgvHangHoa.Rows[index].Cells[1].Value = item.HangHoa.TenHH;
                dgvHangHoa.Rows[index].Cells[2].Value = item.HangHoa.DVT;
                dgvHangHoa.Rows[index].Cells[3].Value = item.GiaNhapHang;
                dgvHangHoa.Rows[index].Cells[4].Value = item.HangHoa.SL;
                if (item.HangHoa.MaNCC == "NCC0      ")
                    dgvHangHoa.Rows[index].Cells[5].Value = "[Chưa có]";
                else
                    dgvHangHoa.Rows[index].Cells[5].Value = item.HangHoa.MaNCC;

                dgvHangHoa.Rows[index].Cells[6].Value = item.HangHoa.NhaCungCap.TenNCC;
            }
        }
        //hàm thêm hàng hóa
        private void tsbThem_Click(object sender, EventArgs e)
        {
            if (NullChecker()) {  return; }
            TonKho s = new TonKho();
            HangHoa s1 = new HangHoa();
            s.MaHH = s1.MaHH = txtMaHT.Text;
            s1.TenHH = txtTenHT.Text;
            s1.DVT = txtDVT.Text;
            s.GiaNhapHang = float.Parse(txtGiaNhapHang.Text);
            s1.Gia = float.Parse(txtGiaBan.Text);
            s1.SL = int.Parse(txtSLNhap.Text);
            s1.MaNCC = cbxNhaCungCap.SelectedValue.ToString();
            //lưu hàng hóa đã thêm
            context.TonKhoes.Add(s);
            context.HangHoas.Add(s1);
            context.SaveChanges();
            //láy hàng tồn
            List<TonKho> listHangTon = context.TonKhoes.ToList();
            List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
            FillFalcultyCombobox(listNhaCungCap);
            BindGrid(listHangTon);
            resetNull();
            MessageBox.Show("Đã thêm thành công", "Thông báo", MessageBoxButtons.OK);
        }
        //hàm sửa
        private void tsbSua_Click(object sender, EventArgs e)
        {
            TonKho dbUpdate = context.TonKhoes.FirstOrDefault(p => p.MaHH == txtMaHT.Text);
            if (dbUpdate != null)
            {
                dbUpdate.HangHoa.TenHH = txtTenHT.Text;
                dbUpdate.HangHoa.DVT = txtDVT.Text;
                dbUpdate.GiaNhapHang = float.Parse(txtGiaNhapHang.Text);
                dbUpdate.HangHoa.SL = int.Parse(txtSLNhap.Text);
                dbUpdate.HangHoa.MaNCC = cbxNhaCungCap.SelectedValue.ToString();
                dbUpdate.HangHoa.Gia = float.Parse(txtGiaBan.Text);
                context.SaveChanges();
                List<TonKho> listHangTon = context.TonKhoes.ToList();
                List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
                FillFalcultyCombobox(listNhaCungCap);
                BindGrid(listHangTon);
                resetNull();
                MessageBox.Show("Đã sửa thành công", "Thông báo", MessageBoxButtons.OK);
            }
            else
            {
                MessageBox.Show("Mã hàng hóa chưa tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }
        //hàm quay về
        private void toolStripLabel1_Click(object sender, EventArgs e)
        {                        
            this.Close();
        }
        //hàm xóa hàng hóa
        private void tsbXoa_Click(object sender, EventArgs e)
        {
            TonKho dbDelete = context.TonKhoes.FirstOrDefault(p => p.MaHH == txtMaHT.Text);
            if (dbDelete != null)
            {
                DialogResult dr = MessageBox.Show("Bạn chắc muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (dr == DialogResult.Yes)
                {
                    context.TonKhoes.Remove(dbDelete);
                    context.SaveChanges();
                    List<TonKho> listHangTon = context.TonKhoes.ToList();
                    List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
                    FillFalcultyCombobox(listNhaCungCap);
                    BindGrid(listHangTon);;
                    resetNull();
                    MessageBox.Show("Đã xóa hàng hóa!", "Thông báo",MessageBoxButtons.OK);
                }
            }
            else
            {
                MessageBox.Show("Không tìm thấy hàng hóa để xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }
        //tìm kiếm hàng hóa thông qua tên hàng hóa và mã hàng hóa
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            var timkiem  = context.TonKhoes.Where(p => p.HangHoa.TenHH.Contains(txtTimKiem.Text) || p.MaHH.Equals(txtTimKiem.Text)).ToList();
            BindGrid(timkiem);
        }
        //Hàm chuyển dữ liệu khi click vào 1 hàng trong datagridview sang các textbox trong thông tin hàng hóa
        private void dgvHangHoa_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = int.Parse(e.RowIndex.ToString());
                txtMaHT.Text = dgvHangHoa[0, index].Value.ToString();
                txtTenHT.Text = dgvHangHoa[1, index].Value.ToString();
                txtDVT.Text = dgvHangHoa[2, index].Value.ToString();
                txtGiaNhapHang.Text = dgvHangHoa[3, index].Value.ToString();
                txtSLNhap.Text = dgvHangHoa[4, index].Value.ToString();
                cbxNhaCungCap.Text = dgvHangHoa[6, index].Value.ToString();
                HangHoa hh = context.HangHoas.FirstOrDefault(p => p.MaHH == txtMaHT.Text);
                txtGiaBan.Text = hh.Gia.ToString();
            }
            catch (ArgumentOutOfRangeException) { }
        }
        //mở form quản lý nhà cung cấp
        private void tsbQLNhaCungCap_Click(object sender, EventArgs e)
        {
            frmNhaCungCap ncc = new frmNhaCungCap();
            ncc.Show();
            this.Close();
          
        }
        private void txtMaHT_KeyPress(object sender, KeyPressEventArgs e)
        {  
            if(!Checker.BackSpace(e.KeyChar))
                if (!Checker.SpecialTextChecker(e.KeyChar.ToString()))
                    e.Handled = true;         
        }

        private void txtTenHT_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.SpecialTextChecker(e.KeyChar.ToString()))
                    e.Handled = true;
        }
        
        private void txtDVT_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.SpecialTextChecker(e.KeyChar.ToString()))
                    e.Handled = true;            
        }

        private void txtGiaNhapHang_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.CheckNumString(e.KeyChar.ToString()))
                    e.Handled = true;
            
        }

        private void txtSLNhap_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.CheckNumString(e.KeyChar.ToString()))
                    e.Handled = true;
           
        }

        private void txtGiaBan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.CheckNumString(e.KeyChar.ToString()))
                    e.Handled = true;
            
        }

        public bool NullChecker()
        {
            if ( Checker.Null(txtMaHT.Text)
              || Checker.Null(txtTenHT.Text)
              || Checker.Null(txtDVT.Text)
              || Checker.Null(txtGiaNhapHang.Text)
              || Checker.Null(txtGiaBan.Text)
              || Checker.Null(txtSLNhap.Text)
              || Checker.Null(txtGiaNhapHang.Text))
            {
                    return true;
            }
            if (Checker.HTDuplicateChecker(txtMaHT.Text, context.TonKhoes.ToList()))
            {
                MessageBox.Show("Mat Hang Da Ton Tai");
                return true;
            }
            return false;
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
    }
}


/*Thêm 1 hàng hóa trùng mã sẽ báo lỗi
 * 
 * */