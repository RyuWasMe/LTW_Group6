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
using System.Data.Entity;
using System.Data.Entity.Core;
using CNPM.Models;
using DevExpress.Utils.Extensions;

namespace CNPM
{
    public partial class frmNhaCungCap : DevExpress.XtraEditors.XtraForm
    {
        public HangHoaDBContext context = new HangHoaDBContext();
        public InputChecker Checker = new InputChecker();
        public frmNhaCungCap()
        {
            InitializeComponent();
        }
        //Load nhà cung cấp lên datagridview khi mở form
        private void frmNhaCungCap_Load(object sender, EventArgs e)
        {
            List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
            listNhaCungCap.RemoveAt(0);
            BindGrid(listNhaCungCap);
        }
        //Hàm binding gridView list nhà cung cấp
        private void BindGrid(List<NhaCungCap> listNhaCungCap)
        {
            dgvDanhSachNhaCungCap.Rows.Clear();  
            foreach (var item in listNhaCungCap)
            {
                int index = dgvDanhSachNhaCungCap.Rows.Add();
                dgvDanhSachNhaCungCap.Rows[index].Cells[0].Value = item.MaNCC;
                dgvDanhSachNhaCungCap.Rows[index].Cells[1].Value = item.TenNCC;
                dgvDanhSachNhaCungCap.Rows[index].Cells[2].Value = item.sdt;
            }
        }
        //hàm reset về giá trị mặc định
        public void resetNull()
        {
            txtMaNCC.Text = txtTenNCC.Text = txtSDT.Text = string.Empty;
        }
        //hàm thêm
        public void insert(int row)
        { 
                NhaCungCap ncc = new NhaCungCap()
                {
                    MaNCC = txtMaNCC.Text,
                    TenNCC = txtTenNCC.Text,
                    sdt = int.Parse(txtSDT.Text),
                };
                context.NhaCungCaps.Add(ncc);
                context.SaveChanges();
 
        }
        //hàm sửa
        public void update(int row)
        {
            List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList(); //lấy danh sách nhà cung cấp   
            NhaCungCap dbUpdate = context.NhaCungCaps.FirstOrDefault(p => p.MaNCC == txtMaNCC.Text);
            if (dbUpdate != null)
            {
                dbUpdate.TenNCC = txtTenNCC.Text;
                dbUpdate.sdt = int.Parse(txtSDT.Text);
                context.SaveChanges();
                BindGrid(listNhaCungCap);
            }
        }
        //hàm kiểm tra ms khoa đã có chưa
        private int GetSelectedRow(string MaNCC)
        {
            for (int i = 0; i < dgvDanhSachNhaCungCap.Rows.Count; i++)
            {
                if (dgvDanhSachNhaCungCap.Rows[i].Cells[0].Value.ToString() == MaNCC)
                {
                    return i;
                }
            }
            return -1;
        }
        //hàm thêm\sửa hàng hóa
        private void btnThemSua_Click(object sender, EventArgs e)
        {
            if (NullChecker()) { return; }
            int row = GetSelectedRow(txtMaNCC.Text);

            if (row == -1)
            {
                row = dgvDanhSachNhaCungCap.Rows.Add();
                insert(row);
                List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
                BindGrid(listNhaCungCap);
                resetNull();
                MessageBox.Show("Đã thêm thành công", "Thông báo");
            }
            else
            {
                update(row);
                resetNull();
                MessageBox.Show("Đã sửa thành công", "Thông báo");
            }
        }
        //hàm xóa
        private void btnXoa_Click(object sender, EventArgs e)
        {
            NhaCungCap dbDelete = context.NhaCungCaps.FirstOrDefault(p => p.MaNCC == txtMaNCC.Text);
            if (dbDelete != null)
            {
                DialogResult dr = MessageBox.Show("Bạn chắc muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (dr == DialogResult.Yes)
                {
                    //kiểm tra có hàng hóa nào có tên nhà cung cấp đó ko
                    //còn nhà cung cấp
                    if (dbDelete != null && context.TonKhoes.Count(s => s.HangHoa.MaNCC == dbDelete.MaNCC) > 0)
                    {
                        DialogResult d = MessageBox.Show("Mặt hàng này vẫn còn, nếu xóa thì  mục nhà cung cấp của hàng tồn đó sẽ thành [Chưa có]. Bạn vẫn muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                        if (d == DialogResult.Yes)
                        {
                            //đổi mục tên nhà cung cấp của mặt hàng thành chưa có và xóa nhà cung cấp đó đi
                            string ms1 = "NCC0";
                            //NhaCungCap ncc = context.NhaCungCaps.Include(n => n.HangHoas).FirstOrDefault(n => n.MaNCC == dbDelete.MaNCC);
                            List<HangHoa> dbUpdate = context.HangHoas.Where(p => p.MaNCC == dbDelete.MaNCC).ToList();
                            foreach (HangHoa item in dbUpdate)
                            {
                                item.MaNCC = ms1;
                            }
                            context.SaveChanges();
                            context.NhaCungCaps.Remove(dbDelete);
                            context.SaveChanges();
                            List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
                            BindGrid(listNhaCungCap);
                            resetNull();
                            MessageBox.Show("Đã xóa thành công", "Thông báo", MessageBoxButtons.OK);
                        }
                    }
                    else
                    {
                        //xóa nhà cung cấp nếu ko còn mặt hàng nào
                        context.NhaCungCaps.Remove(dbDelete);
                        context.SaveChanges();
                        List<NhaCungCap> listNhaCungCap = context.NhaCungCaps.ToList();
                        BindGrid(listNhaCungCap);
                        resetNull();
                        MessageBox.Show("Đã xóa thành công", "Thông báo", MessageBoxButtons.OK);
                    }
                }
            }
        }
        //hàm thoát
        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
            frmKhoHang f1 = new frmKhoHang();
            f1.Show();
        }
        //Hàm chuyển dữ liệu khi click vào 1 hàng trong datagridview sang các textbox trong thông tin nhà cung cấp
        private void dgvDanhSachNhaCungCap_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = int.Parse(e.RowIndex.ToString());
                txtMaNCC.Text = dgvDanhSachNhaCungCap[0, index].Value.ToString();
                txtTenNCC.Text = dgvDanhSachNhaCungCap[1, index].Value.ToString();
                txtSDT.Text = dgvDanhSachNhaCungCap[2, index].Value.ToString();
            }
            catch(ArgumentOutOfRangeException) { }
        }

        private void txtMaNCC_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.SpecialTextChecker(e.KeyChar.ToString()))
                    e.Handled = true;
        }

        private void txtTenNCC_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.SpecialTextChecker(e.KeyChar.ToString()))
                    e.Handled = true;
        }

        private void txtSDT_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Checker.BackSpace(e.KeyChar))
                if (!Checker.CheckNumString(e.KeyChar.ToString()))
                    e.Handled = true;
        }

        public bool NullChecker()
        {
            if (Checker.Null(txtMaNCC.Text)
              || Checker.Null(txtTenNCC.Text)
              || Checker.Null(txtSDT.Text))
            {
                return true;
            }
            
            return false;
        }

        private void txtTenNCC_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmNhaCungCap_FormClosed(object sender, FormClosedEventArgs e)
        {
            frmKhoHang f1 = new frmKhoHang();
            f1.Show();
        }
    }
}

/*
 * Thêm 1 hàng hóa trùng mã sẽ báo lỗi
 * Sửa 1 hàng hóa chưa tồn tại sẽ báo lỗi
 * Xóa 1 hàng hóa chưa chọn sẽ báo lỗi
 * */