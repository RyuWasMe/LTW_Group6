using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CNPM.Models;

namespace CNPM
{
    public class InputChecker
    {
        public List<HangHoa> hangHoas = new List<HangHoa>();
        public string specialchar = "~!@#$%^&*()_+-*/,.<>;:[{}]|?";
        public InputChecker() { }

        public bool Null(string s)
        {
            if (s == string.Empty)
            {
                MessageBox.Show("Khong duoc de trong", "thong bao", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return true;
            }
            return false;
        }
        public bool SpecialTextChecker(string s)
        {
            foreach (var item in s)
            {
                if (specialchar.Contains(item))
                {
                    MessageBox.Show("Không được nhập ký tự đặc biệt","thong bao",MessageBoxButtons.OK,MessageBoxIcon.Error);
                    return false;
                }
            }
            return true;
        }
        public bool NumChecker(char s)
        {
            try
            {
                int.Parse(s.ToString());
            }
            catch (FormatException)
            {
                return false;
            }
            return true;
        }

        public bool CharChecker(char s)
        {
            if ((65 <= s && s <= 90) || (97 <= s && s <= 122))
            {
                return true;
            }
            return false;
        }

        public bool BackSpace(char s)
        {
            if(s == 8 || s == 27 || s == 13 || s == 32 || s == 37 || s == 38 || s ==39 || s == 40)
            return true;
            return false;
        }
        public bool StringChecker(string s)
        {
            foreach (var item in s)
            {
                if (!CharChecker(item))
                {
                    MessageBox.Show("chỉ được nhập chữ", "thong bao", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }
            return true;
        }
        public bool CheckNumString(string s)
        {
            try
            {
                int.Parse(s);
            }
            catch (FormatException)
            {
                MessageBox.Show("Chỉ được nhập số", "thong bao", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true ;
        }
        public bool HHDuplicateChecker(string s, List<HangHoa> hangHoas)
        {
            foreach (var item in hangHoas)
            {
                if (item.MaHH == s)
                {
                    return true;
                }
            }
            return false;
        }

        public bool HTDuplicateChecker(string s, List<TonKho> hangHoas)
        {
            foreach (var item in hangHoas)
            {
                if (item.MaHH == s)
                {
                    return true;
                }
            }
            return false;
        }

        public bool NCCDuplicateChecker(string s, List<NhaCungCap> NCC)
        {
            foreach (var item in NCC)
            {
                if (item.MaNCC == s)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
