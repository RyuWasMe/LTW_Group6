using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyException
{
    public class DuplicateException : Exception
    {
        public DuplicateException() { } 
        public DuplicateException(string message) : base(message) { }
        public DuplicateException(string message, Exception innerException) : base(message, innerException) { }

        public override string Message =>
         $"Dữ Liệu Không Được Trùng Với Database";
    }
}
