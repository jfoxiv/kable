using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Represents a procedural description of how to resolve
/// a particular administrative problem in the SIMLABB
/// environment.
/// </summary>
public class Procedure
{
    // for gettin' 'em and settin' 'em.
    public Procedure() { }
    public int ProcID { get; set;}
    public int PolicyID { get; set; }
    public int CategoryID { get; set; }
    public string Summary { get; set; }
    public string Content { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedOn { get; set; }
    public string Approved { get; set; }		
}
