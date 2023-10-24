using CNPM.Models;
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
    public partial class frmGioHang : Form
    {
        public List<HangHoa> HangTrongGio = new List<HangHoa>();
        public HangHoaDBContext Context = new HangHoaDBContext();
        public frmGioHang()
        {
            InitializeComponent();
        }

        public void CapNhatGioHang(List<HangHoa> GH)
        {
            this.HangTrongGio = GH;
        }
        private void BindGrid(List<HangHoa> listHangTon)
        {
            dgvHangHoa.Rows.Clear();
            double TongTien = 0;
            foreach (var item in listHangTon)
            {
                int index = dgvHangHoa.Rows.Add();
                dgvHangHoa.Rows[index].Cells[0].Value = item.MaHH;
                dgvHangHoa.Rows[index].Cells[1].Value = item.TenHH;
                dgvHangHoa.Rows[index].Cells[2].Value = item.DVT;
                dgvHangHoa.Rows[index].Cells[3].Value = item.Gia;
                dgvHangHoa.Rows[index].Cells[4].Value = "+";
                dgvHangHoa.Rows[index].Cells[5].Value = item.SL;
                dgvHangHoa.Rows[index].Cells[6].Value = "-";
                double TongTienSP = 0;
                    TongTienSP += item.SL * item.Gia;
                dgvHangHoa.Rows[index].Cells[7].Value = TongTienSP;
                TongTien += TongTienSP;
            }
            txtTongTien.Text = TongTien.ToString();
        }
        private void GioHang_Load(object sender, EventArgs e)
        {
            BindGrid(HangTrongGio);
        }

        private void dgvHangHoa_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            string MaHH = dgvHangHoa[0, e.RowIndex].Value.ToString();
            if (dgvHangHoa.Columns[e.ColumnIndex] is DataGridViewButtonColumn &&
                e.RowIndex >= 0 && e.ColumnIndex == 4)
            {
                if(HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH).SL ++ >= Context.HangHoas.FirstOrDefault(p => p.MaHH == MaHH).SL)
                {
                    MessageBox.Show("Số lượng hàng vượt quá hàng sẵn có, không thể thêm");
                    HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH).SL--;
                }
            }
            else if (dgvHangHoa.Columns[e.ColumnIndex] is DataGridViewButtonColumn &&
                e.RowIndex >= 0 && e.ColumnIndex == 6)
            {
                HangHoa HH = HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH);
                int SL = HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH).SL--;
                if(SL == 1)
                {
                    HangTrongGio.Remove(HH);
                }
            }
            BindGrid(HangTrongGio);
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            // An frmGioHang de mo frmThanhToan
            this.Hide();
            frmThanhToan f1 = new frmThanhToan();
            f1.DonHangTuGioHang = HangTrongGio;
            f1.capNhatDonHang();
            /* f1.FormClosed += (s, args) =>
            {
                //Hien thi lai frmGioHang khi dong frmThanhToan
                this.Show();
            }; */
            f1.ShowDialog();
        }

        private void dgvHangHoa_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {           
            
            string MaHH = dgvHangHoa[0, e.RowIndex].Value.ToString();
            HangHoa HH = HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH);
            int SLT = Context.HangHoas.FirstOrDefault(t => t.MaHH == MaHH).SL;
            int SL = int.Parse(dgvHangHoa[5, e.RowIndex].Value.ToString());
            if(SL <= 1) { HangTrongGio.Remove(HH); }
            else if (SL > SLT)
            {
                MessageBox.Show("Số lượng hàng vượt quá hàng sẵn có, không thể thêm");
                dgvHangHoa[5, e.RowIndex].Value = 1;
                HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH).SL = 1;
            }
            else
            {
                HangTrongGio.FirstOrDefault(p => p.MaHH == MaHH).SL = SL;
            }
           
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
