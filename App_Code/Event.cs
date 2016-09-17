using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Represents a historical event within
/// the SIMMLAB environment.
/// </summary>
public class Event
{
    public Event() { }
    public int EventID { get; set; }
    public string CategoryID { get; set; }
    public string Summary { get; set; }
    public string Content { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedOn { get; set; }
} 
