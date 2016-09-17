<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="StyleGuide.aspx.cs" Inherits="TemplatesAndStyleGuide_StyleGuide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Procedure Write-Up Style Guide</h1>
    Your entries for the knowledge base will be based on a two-part template. The first part part explains the entry's topic and associates it with a SIMMLAB management policy. The second details the specific instructions for carrying out the procedure. For example:<br/>

    <p/>
    <i>
    &nbsp;&nbsp;&nbsp;&nbsp; Procedure: Chronos Configuration
    <p/>    
    &nbsp;&nbsp;&nbsp;&nbsp; In keeping with policy "Always Keep Systems Backed Up", we make use of<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; the Chronos backup system for VMWare hosts. Chronos configuration<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; can be a little tricky, but once you're used to it you won't have<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; a problem.<br/>

    <p/>
    &nbsp;&nbsp;&nbsp;&nbsp; Instructions: How you configure Chronos:

    <p/>
    &nbsp;&nbsp;&nbsp;&nbsp; 1) Choose Start -> Control Panel -> Chronos<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; ...<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; 13) Click each "OK" button on the screen, and you're done.<br/>
    </i>

    <p/>
    The "instructions" portion need not appear in list form--that's up to you. Use your best judgement. Either way, keep in mind the rules detailed below.

    <p/>
    If you're documenting configuration information rather than a "how to", then associate your entry with the "Keep System Documentation Current" policy, and erase the "Instructions" portion of the template.

    <p/>
    Always remember your audience when composing knowledge base entries. In the case of the SIMMLAB, the audience is other students. Some of them may be new to computer and network administration. When the audience contains novices, clarity is very important. Your entries will be easier to read and understand if you follow these rules.


    <p/>
    <h3>Use Present Tense</h3>

    <p/>
    Always write in present tense. For example, change<p/>
    &nbsp;&nbsp;&nbsp;&nbsp; Next, you will activate the backup system.

    <p/>
    to<p/>
    &nbsp;&nbsp;&nbsp;&nbsp; Next, activate the backup system.<br/>


    <p/>
    <h3>Write Short Sentences</h3>

    <p/>
    Readers can have a difficult time with long sentences, especially when the topic is new to them. After you've written a sentence, try to break it into multiple, smaller sentences. For example, change

    <p/>
    &nbsp;&nbsp;&nbsp;&nbsp Run the kernel configuration script, choosing all<br/>
    &nbsp;&nbsp;&nbsp;&nbsp options pertaining to the host hardware, and,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp having configured the kernel, start the build<br/>
    &nbsp;&nbsp;&nbsp;&nbsp process.<br/>

    <p/>
    to

    <p/>
    &nbsp;&nbsp;&nbsp;&nbsp; Run the kernel configuration script. Choose all<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; the options pertaining to the host hardware. Start<br/>
    &nbsp;&nbsp;&nbsp;&nbsp; the build process.<br/>

    <p/>
    Shorter sentences make information more digestible.

    <p/>
    <h3>Avoid Passive Voice</h3>
    <p/>
    The active voice generally requires fewer words and results in shorter sentences (see above). More significantly, "it reverses the way most people think about activity because instead of having the subject do something to the object, the object does something to the subject [and] because of that, it's less clear." (Zeff, 2008).
    <p/>
    Most English sentences contain an actor (subject), and an action (verb) performed by the actor. In the passive voice, the action preceds the actor. The active voice places the actor before the action. For example, with "Joe" as the actor, and "installed" as the action:
    <p/>
    &nbsp;&nbsp;&nbsp;&nbsp; <b>Passive</b>: The operating system was installed by Joe.<p/>
    &nbsp;&nbsp;&nbsp;&nbsp; <b>Active</b>: Joe installed the operating system.<br/>


    <p/>
    Present tense, short sentences, and active voice. Keep these in mind when composing procedures and your document will be better for you, and your readers.
    <p/>
    REFERENCE
    <br/>
    Zeff, J. (2008, August 23). Re: why is the passive voice bad? [Online forum comment]. Retrieved from http://www.writers.net/forum/showthread.php?109014-Why-is-the-passive-voice-quot-bad-quot


</asp:Content>

