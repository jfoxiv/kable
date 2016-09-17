using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///  Represent a policy governing SIMLABB administration.
/// </summary>
public class Policy
{
    public Policy() { }
    public int PolicyID { get; set; }
    public string Title { get; set; }
    public string Content { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedOn { get; set; }
    public string LastUpdatedBy { get; set; }
    public string LastUpdatedOn { get; set; }
} 
