using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Text = "";
    }

    protected void DvCategories_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No records deleted; another user may have removed that category. ";

        else
            GvCategories.DataBind();
    }

    protected void DvCategories_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "The database had a problem adding the category: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
            GvCategories.DataBind();
    }

    protected void DvCategories_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "The database had a problem updating the category: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No database records updated; perhaps someone else already did this.";
        else
            GvCategories.DataBind();
    }
}
