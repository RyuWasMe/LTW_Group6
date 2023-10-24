namespace CNPM
{
    partial class frmGioHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvHangHoa = new System.Windows.Forms.DataGridView();
            this.btnThanhToan = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtTongTien = new System.Windows.Forms.TextBox();
            this.clMaHH = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clTenHH = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clDVT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clGiaBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clTang = new System.Windows.Forms.DataGridViewButtonColumn();
            this.clSL = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clGIam = new System.Windows.Forms.DataGridViewButtonColumn();
            this.clTongGiaBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHangHoa)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvHangHoa
            // 
            this.dgvHangHoa.AllowUserToAddRows = false;
            this.dgvHangHoa.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvHangHoa.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clMaHH,
            this.clTenHH,
            this.clDVT,
            this.clGiaBan,
            this.clTang,
            this.clSL,
            this.clGIam,
            this.clTongGiaBan});
            this.dgvHangHoa.Dock = System.Windows.Forms.DockStyle.Top;
            this.dgvHangHoa.Location = new System.Drawing.Point(0, 0);
            this.dgvHangHoa.Name = "dgvHangHoa";
            this.dgvHangHoa.RowHeadersWidth = 51;
            this.dgvHangHoa.RowTemplate.Height = 24;
            this.dgvHangHoa.Size = new System.Drawing.Size(889, 325);
            this.dgvHangHoa.TabIndex = 5;
            this.dgvHangHoa.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvHangHoa_CellContentClick);
            this.dgvHangHoa.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvHangHoa_CellEndEdit);
            // 
            // btnThanhToan
            // 
            this.btnThanhToan.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThanhToan.Location = new System.Drawing.Point(682, 357);
            this.btnThanhToan.Name = "btnThanhToan";
            this.btnThanhToan.Size = new System.Drawing.Size(172, 51);
            this.btnThanhToan.TabIndex = 6;
            this.btnThanhToan.Text = "Thanh Toán";
            this.btnThanhToan.UseVisualStyleBackColor = true;
            this.btnThanhToan.Click += new System.EventHandler(this.btnThanhToan_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(342, 370);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(102, 25);
            this.label1.TabIndex = 7;
            this.label1.Text = "Tổng Tiền";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // txtTongTien
            // 
            this.txtTongTien.BackColor = System.Drawing.Color.AliceBlue;
            this.txtTongTien.Enabled = false;
            this.txtTongTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTongTien.ForeColor = System.Drawing.SystemColors.WindowText;
            this.txtTongTien.Location = new System.Drawing.Point(476, 361);
            this.txtTongTien.Name = "txtTongTien";
            this.txtTongTien.Size = new System.Drawing.Size(172, 34);
            this.txtTongTien.TabIndex = 8;
            // 
            // clMaHH
            // 
            this.clMaHH.HeaderText = "MaHH";
            this.clMaHH.MinimumWidth = 6;
            this.clMaHH.Name = "clMaHH";
            this.clMaHH.ReadOnly = true;
            this.clMaHH.Width = 102;
            // 
            // clTenHH
            // 
            this.clTenHH.HeaderText = "TenHH";
            this.clTenHH.MinimumWidth = 6;
            this.clTenHH.Name = "clTenHH";
            this.clTenHH.ReadOnly = true;
            this.clTenHH.Width = 101;
            // 
            // clDVT
            // 
            this.clDVT.HeaderText = "Đơn Vị";
            this.clDVT.MinimumWidth = 6;
            this.clDVT.Name = "clDVT";
            this.clDVT.ReadOnly = true;
            this.clDVT.Width = 102;
            // 
            // clGiaBan
            // 
            this.clGiaBan.HeaderText = "Giá";
            this.clGiaBan.MinimumWidth = 6;
            this.clGiaBan.Name = "clGiaBan";
            this.clGiaBan.ReadOnly = true;
            this.clGiaBan.Width = 102;
            // 
            // clTang
            // 
            this.clTang.HeaderText = "Tăng";
            this.clTang.MinimumWidth = 6;
            this.clTang.Name = "clTang";
            this.clTang.ReadOnly = true;
            this.clTang.Width = 102;
            // 
            // clSL
            // 
            this.clSL.HeaderText = "SoLuong";
            this.clSL.MinimumWidth = 6;
            this.clSL.Name = "clSL";
            this.clSL.Width = 102;
            // 
            // clGIam
            // 
            this.clGIam.HeaderText = "Giảm";
            this.clGIam.MinimumWidth = 6;
            this.clGIam.Name = "clGIam";
            this.clGIam.ReadOnly = true;
            this.clGIam.Width = 101;
            // 
            // clTongGiaBan
            // 
            this.clTongGiaBan.HeaderText = "TongGia";
            this.clTongGiaBan.MinimumWidth = 6;
            this.clTongGiaBan.Name = "clTongGiaBan";
            this.clTongGiaBan.ReadOnly = true;
            this.clTongGiaBan.Width = 125;
            // 
            // frmGioHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(889, 420);
            this.Controls.Add(this.txtTongTien);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnThanhToan);
            this.Controls.Add(this.dgvHangHoa);
            this.Name = "frmGioHang";
            this.Text = "GioHang";
            this.Load += new System.EventHandler(this.GioHang_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvHangHoa)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvHangHoa;
        private System.Windows.Forms.Button btnThanhToan;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtTongTien;
        private System.Windows.Forms.DataGridViewTextBoxColumn clMaHH;
        private System.Windows.Forms.DataGridViewTextBoxColumn clTenHH;
        private System.Windows.Forms.DataGridViewTextBoxColumn clDVT;
        private System.Windows.Forms.DataGridViewTextBoxColumn clGiaBan;
        private System.Windows.Forms.DataGridViewButtonColumn clTang;
        private System.Windows.Forms.DataGridViewTextBoxColumn clSL;
        private System.Windows.Forms.DataGridViewButtonColumn clGIam;
        private System.Windows.Forms.DataGridViewTextBoxColumn clTongGiaBan;
    }
}