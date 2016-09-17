using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageConfig: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Text = "";
    }

    protected void DvConfig_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            //TODO: make this display message in dedicated error page.
            lblErrorMessage.Text = "The database had a problem updating the value: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No database records updated; perhaps someone else already did this.";
        else
            GvConfig.DataBind();
    }
}
