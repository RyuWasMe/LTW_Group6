using CNPM.Models;
using DevExpress.Data.ODataLinq.Helpers;
using DevExpress.Utils;
using DevExpress.XtraBars;
using DevExpress.XtraEditors;
using DevExpress.XtraGrid.Views.Grid;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TextBox;

namespace CNPM
{
    public partial class frmQLBH : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public HangHoaDBContext context = new HangHoaDBContext();
        public InputChecker Checker = new InputChecker();
        public List<HangHoa> GH = new List<HangHoa>();
        public List<HangHoa> listHangHoa = new List<HangHoa>();
        public string MaHHTD;

        public bool isThoat = true;
        public event EventHandler DangXuat;
        public TaiKhoan taiKhoan;
        public frmQLBH(TaiKhoan loggedInUser)
        {
            InitializeComponent();
            taiKhoan = loggedInUser;
        }
        public frmQLBH()
        {
            InitializeComponent();
        }
        void bbiPrintPreview_ItemClick(object sender, ItemClickEventArgs e)
        {
            gclBanHang.ShowRibbonPrintPreview();
        }
        private void frmQLBH_Load(object sender, EventArgs e)
        {
            listHangHoa = context.HangHoas.ToList();
            // TODO: This line of code loads data into the 'quanLyTapHoaDataSet1.HangHoa' table. You can move, or remove it, as needed.
            this.hangHoaTableAdapter1.Fill(this.quanLyTapHoaDataSet1.HangHoa);
            MaHHTD = listHangHoa[0].MaHH;
            SL = listHangHoa[0].SL;
            FirstBindingValue();
        }
        public void FirstBindingValue()
        {           
            HangHoa FirstValue = context.HangHoas.First();
            InfoBar.Caption = "Mã Hàng Hóa:" + FirstValue.MaHH
                    + "       Tên Hàng Hóa:" + FirstValue.TenHH
                    + "          Nhà Cung Cấp:" + FirstValue.NhaCungCap.TenNCC;
        }
        private void barbtnKhoHang_ItemClick(object sender, ItemClickEventArgs e)
        {
            frmKhoHang KhoHang = new frmKhoHang();
            KhoHang.ShowDialog();
            load();
        }

        private void barbtnCart_ItemClick(object sender, ItemClickEventArgs e)
        {
            if(GH.Count == 0)
            {
                MessageBox.Show("Chưa có mặt hàng nào trong giỏ");
                return;
            }
            frmGioHang frmGioHang = new frmGioHang();
            frmGioHang.CapNhatGioHang(GH);
            frmGioHang.ShowDialog();
            frmGioHang.Close();
            load();
        }
        public object SL;
        private void barBtnAddToCart_ItemClick(object sender, ItemClickEventArgs e)
        {
            
            HangHoa HH = listHangHoa.FirstOrDefault(p => p.MaHH == MaHHTD);
            
            int sl = int.Parse(SL.ToString());
            if (context.HangHoas.FirstOrDefault(p => p.MaHH == HH.MaHH).SL == 0)
            {
                MessageBox.Show("Mặt hàng này đã hết");
                return;
            }
            if (GH.FirstOrDefault(p => p.MaHH == MaHHTD) != default(HangHoa))
            {
               if (GH.FirstOrDefault(p => p.MaHH == MaHHTD).SL++ >= sl)
                {
                    MessageBox.Show("Số lượng hàng vượt quá hàng sẵn có, không thể thêm");
                    GH.FirstOrDefault(p => p.MaHH == MaHHTD).SL--;
                }
                else
                {
                    MessageBox.Show("Đã Thêm Vào Giỏ!!");
                }
            }
            else
            {
                HH.SL = 1;
                GH.Add(HH);
                MessageBox.Show("Đã Thêm Vào Giỏ!");
            }
        }
       
        private void gridView_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {            
            var MaHH = (sender as GridView).GetFocusedRowCellValue("MaHH");
            var TenHH = (sender as GridView).GetFocusedRowCellValue("TenHH");
            SL = (sender as GridView).GetFocusedRowCellValue("SL");
            string NCC = context.HangHoas.FirstOrDefault(p => p.MaHH == MaHH.ToString()).MaNCC;
            string TenNCC = context.NhaCungCaps.FirstOrDefault(p => p.MaNCC == NCC).TenNCC;
            MaHHTD = MaHH.ToString();
            InfoBar.Caption = "MaHH:" + MaHH.ToString() + "       TenHH:" + TenHH.ToString() + "          Nhà Cung Cấp:" + TenNCC;
        }

        private void barbtnRefesh_ItemClick(object sender, ItemClickEventArgs e)
        {
            load();
        }

        public void load()
        {
            this.hangHoaTableAdapter1.Fill(this.quanLyTapHoaDataSet1.HangHoa);
            FirstBindingValue();
            context = new HangHoaDBContext();
        }
        private void barbtnUser_ItemClick(object sender, ItemClickEventArgs e)
        {
            frmThongTinTaiKhoan tttk = new frmThongTinTaiKhoan(taiKhoan);
            tttk.ShowDialog();
        }

        private void barbtnChangePass_ItemClick(object sender, ItemClickEventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có muốn đổi mật khẩu?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

            if (result == DialogResult.Yes)
            {
                // Tạo và hiển thị form đổi mật khẩu
                frmDoiMatKhau changePassword = new frmDoiMatKhau(taiKhoan);
                changePassword.ShowDialog(); // Sử dụng ShowDialog() để chặn thao tác với cửa sổ chính cho đến khi form đổi mật khẩu được đóng lại
            }
        }

        private void barbtnLogOut_ItemClick(object sender, ItemClickEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn đăng xuất ?", "Cảnh báo", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                DangXuat(this, new EventArgs());
            }              
        }

        private void frmQLBH_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (isThoat)
                Application.Exit();
        }

        private void frmQLBH_FormClosing(object sender, FormClosingEventArgs e)
        {

            if (isThoat)
            {
                if (MessageBox.Show("Bạn muốn thoát chương trình", "Cảnh báo", MessageBoxButtons.YesNo) != DialogResult.Yes)
                {
                    e.Cancel = true;
                }
            }
        }

        private void barbtnDoanhThu_ItemClick(object sender, ItemClickEventArgs e)
        {
            frmDoanhThu f1 = new frmDoanhThu();
            f1.ShowDialog();
        }
    }
}