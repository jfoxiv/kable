using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// generic exception for when one of my methods is passed one or more bad args
/// </summary>
public class BadArgsException : Exception
{
        public BadArgsException()
        {
        }

        public BadArgsException(string message)  : base(message)
        {
        }

        public BadArgsException(string message, Exception inner) : base(message, inner)
        {
        }
}