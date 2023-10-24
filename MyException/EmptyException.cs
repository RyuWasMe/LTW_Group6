using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyException
{
    public class EmptyException : Exception
    {
        public EmptyException() { }
        public EmptyException(string message) : base(message) { }
        public EmptyException(string message, Exception innerException) : base(message, innerException) { }

        public override string Message =>
         $"Dữ Liệu Không Được Để Trống";
    }
}
