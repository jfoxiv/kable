using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CreateOrEditProcedure: System.Web.UI.Page
{
    // these will be used when sending moderation alerts
    public static string AdminEmail;
    public static string SmtpServer;
    public static string ProcCreator;
    public static string ProcSummary;


    DataView configTable;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Text = "";

        // populate config variables
        configTable = (DataView)dataGetAdminEmail.Select(DataSourceSelectArguments.Empty);
        DataRowView row = configTable[0];
        CreateOrEditProcedure.AdminEmail = row["Value"].ToString();

        configTable = (DataView)dataGetSmtpServer.Select(DataSourceSelectArguments.Empty);
        row = configTable[0];
        CreateOrEditProcedure.SmtpServer = row["Value"].ToString();
    }



    protected void DvProcedures_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        // check for database exception
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No database records updated: Someone else may already have updated that procedure.";
        else
            GvProcedures.DataBind();

        // email admin about updated procedure
        // TODO: get username programmatically
        string user = "dsidious";
        ProcSummary = e.NewValues["Summary"].ToString();
        ProcCreator = dataDvProcedures.InsertParameters["CreatedBy"].DefaultValue;

        this.SendEmailMessage(AdminEmail,
                              SmtpServer,
                              user,
                              ProcSummary,
                              "update");
    }




    protected void DvProcedures_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        // check for database exception and such. then re-bind the gridview
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "No error was detected, but procedure could not be added to the database.";
        else
        {
            GvProcedures.DataBind();
        }

        ProcSummary = e.Values["Summary"].ToString();
        ProcCreator = dataDvProcedures.InsertParameters["CreatedBy"].DefaultValue;

        // send email to admin
        this.SendEmailMessage(AdminEmail,
                              SmtpServer,
                              ProcCreator,
                              ProcSummary,
                              "create");

    }

    protected void DvProcedures_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        // set "CreatedBy" attribute for dataview's "insert" command
        // TODO: get username programitically
        string userName = "dvader";
        dataDvProcedures.InsertParameters["CreatedBy"].DefaultValue = userName;

    }

    protected void SendEmailMessage(string toAddr, string mailServer, string user, string summary, string updateOrCreate)
    {
        string subject;
        string body;

        switch (updateOrCreate)
        {
            case "update": // someone updated an existing procedure
                subject = "kable: An updated procedure requires moderation";
                body = "Procedure \"" + summary + "\" has been updated by " +
                        user + " and requires moderation.";
                break;
            case "create": // someone created a new procedure
                subject = "kable: A new procedure requires moderation";
                body = "Procedure \"" + summary + "\" has been created by " +
                        user + " and requires moderation.";
                break;
            default:
                // throw an exception
                throw new BadArgsException("Value of \"updateOrCreate\" must be either \"update\" or \"create\"");
                return;
        }

        // create the message
        MailMessage msg = new MailMessage("kable@localhost", toAddr);
        msg.Subject = subject;
        msg.Body = body;

        // send it
        SmtpClient client = new SmtpClient(mailServer);
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.Port = 25;

        try
        {
            client.Send(msg);
        }
        catch (SmtpException ex)
        {
            lblErrorMessage.Text = "Could not email " + toAddr + " via " + mailServer + ": " + ex.Message
                + " The SMTP server is probably inacessible.";
        }
    }
}
