using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagePolicies: System.Web.UI.Page
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
            lblErrorMessage.Text = "Someone else may already have deleted that policy.";
        else
            GvPolicies.DataBind();
    }

    protected void dvBtnAddPolicy(object sender, DetailsViewInsertedEventArgs e)
    {

        if (e.Exception != null)
        {
            // TODO: change this to redirect exception message to error page.
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No error was detected, but policy could not be added to database.";
        else
            GvPolicies.DataBind();
    }

    protected void dvBtnSetPolicyCreator(object sender, DetailsViewInsertEventArgs e)
    {
        // this sets the "CreatedBy" parameter, since we don't want user to enter
        // it into form, and we also don't want to give them a list of users because
        // 1) we don't want to dick with getting lists of windows domain users, and
        // 2) we shouldn't let them use somebody else's name anyways

        //TODO: get username programmatically
        dataSrcDvPolicies.InsertParameters["CreatedBy"].DefaultValue = "foo";
    }
    protected void DvPolicies_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            // TODO: dipslay in dedicated error page.
            lblErrorMessage.Text = "The database had a problem updating the policy: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No database records updated; perhaps someone else already did this.";
        else
            GvPolicies.DataBind();
    }
}
