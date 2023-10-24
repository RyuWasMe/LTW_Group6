using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MyException
{
    public class NumberException : Exception
    {
        public NumberException()
        {
        }

        public NumberException(string message) : base(message)
        {
        }

        public NumberException(string message, Exception innerException) : base(message, innerException)
        {
        }
        public override string Message =>
             $"Chỉ Được nhập số";
    }
}
