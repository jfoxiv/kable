using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageEvents: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Text = "";
    }

    protected void dvBtnDelete(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            // TODO: change this to redirect exception message to error page.
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "Someone else may already have deleted that event.";
        else
            GvEvents.DataBind();
    }

 
    protected void dvBtnAddEvent(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            // TODO: change this to redirect exception message to error page.
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No error was detected, but event could not be added to database.";
        else
            GvEvents.DataBind();
    }
    protected void dvBtnSetEventCreator(object sender, DetailsViewInsertEventArgs e)
    {
        // this sets the "CreatedBy" parameter, since we don't want user to enter
        // it into form, and we also don't want to give them a list of users because
        // 1) we don't want to dick with getting lists of windows domain users, and
        // 2) we shouldn't let them use somebody else's name anyways

        //TODO: get username programmatically
        dataSrcDvEvents.InsertParameters["CreatedBy"].DefaultValue = "foo";
    }
    protected void DvEvents_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "The database had a problem updating the event: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No database error found, but the event was not updated.";
        else
            GvEvents.DataBind();
    }

    protected void PreventErrorOnBinding(object sender, EventArgs e)
    {
        DropDownList ddlEventCategories = (DropDownList)sender;
        ddlEventCategories.DataBinding -= new EventHandler(PreventErrorOnBinding);
        ddlEventCategories.AppendDataBoundItems = true;
        ListItem li = new ListItem("Choose Category", "");
        ddlEventCategories.Items.Insert(0, li);

        try
        {
            ddlEventCategories.DataBind();
        }
        catch (ArgumentOutOfRangeException)
        {
            ddlEventCategories.SelectedValue = "";
        }
    }
}