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
    public partial class frmThanhToan : DevExpress.XtraEditors.XtraForm
    {
        public List<HangHoa> DonHangTuGioHang { get; set; }
        private List<HangHoa> danhSachDonHangThanhToan = new List<HangHoa>();
        public List<HangHoa> HangTrongGio = new List<HangHoa>();
        public HangHoaDBContext context = new HangHoaDBContext();
        public frmThanhToan()
        {
            InitializeComponent();
        }

        public void capNhatDonHang()
        {
            if(DonHangTuGioHang != null)
            {
                int STT = 1;
                foreach(var hangHoa in DonHangTuGioHang)
                {
                    danhSachDonHangThanhToan.Add(hangHoa);
                    STT++;
                }

                bindGrid(danhSachDonHangThanhToan);
            }
        }

        private void bindGrid(List<HangHoa> danhSachDonHang)
        {
            dgvThanhToan.Rows.Clear();

            int STT = 1;

            int soLuong = 0; 

            foreach (var hangHoa in danhSachDonHang)
            {
                int index = dgvThanhToan.Rows.Add();

                dgvThanhToan.Rows[index].Cells[0].Value = STT;
                dgvThanhToan.Rows[index].Cells[1].Value = hangHoa.TenHH;
                dgvThanhToan.Rows[index].Cells[2].Value = hangHoa.Gia;
                dgvThanhToan.Rows[index].Cells[3].Value = hangHoa.SL;

                double TongTien = hangHoa.Gia * hangHoa.SL;
                dgvThanhToan.Rows[index].Cells[4].Value = TongTien;

                soLuong += hangHoa.SL;

                STT++; 
            }

            lbTongSoLuong.Text = "....";
            lbThanhTien.Text = "0đ";
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có muốn hủy đơn hay không?", "Xác nhận", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                if (DonHangTuGioHang != null)
                {
                    DonHangTuGioHang.Clear();
                    HangTrongGio.Clear();
                }
                dgvThanhToan.Rows.Clear();
                MessageBox.Show("Đã hủy đơn thành công! ");
                this.Close();

            }
            else if (result == DialogResult.No)
            {
                ///////
            }
        }
        //
        //

        //
        //

        private void btnThanhToan_Click(object sender, EventArgs e)
        {           
            int tongSoLuong = DonHangTuGioHang.Sum(item => item.SL);
           
            double tongGiaTri = DonHangTuGioHang.Sum(item => item.Gia * item.SL);
            double tongGiaGoc = DonHangTuGioHang.Sum(item => item.TonKho.GiaNhapHang * item.SL);
            lbTongSoLuong.Text = tongSoLuong.ToString();
            lbThanhTien.Text = tongGiaTri.ToString();

            int count = context.Doanh_Thus.ToList().Count();
            string MaDT = "LB" + count.ToString();


            Doanh_Thu doanh_Thu = new Doanh_Thu()
            {
                Mã_Doanh_Thu = MaDT,
                Tổng_Giá_Bán = tongGiaTri,
                Tổng_Giá_Gốc = tongGiaGoc

            };
            context.Doanh_Thus.Add(doanh_Thu);
            foreach (var item in danhSachDonHangThanhToan)
            {
                int SL = context.HangHoas.FirstOrDefault(p => p.MaHH == item.MaHH).SL;
                context.HangHoas.FirstOrDefault(p => p.MaHH == item.MaHH).SL = SL - item.SL;
            }
            context.SaveChanges();
            DonHangTuGioHang.Clear();
            HangTrongGio.Clear();
            MessageBox.Show("Đã thanh toán thành công", "Thông báo");
            this.Close();
        }

        private static frmGioHang gioHangForm;

        private void danhSáchHàngHóaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (gioHangForm != null)
            {
                gioHangForm.Show();
            }
            else
            {
                gioHangForm = new frmGioHang();
                gioHangForm.FormClosed += (s, args) =>
                {
                    gioHangForm = null;
                };
                gioHangForm.Show();
            }

            this.Close();
        }

        private void frmThanhToan_Load(object sender, EventArgs e)
        {
            bindGrid(DonHangTuGioHang);
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
    }
}