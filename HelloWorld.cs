using System;
using System.Management.Automation;

namespace TestCmdLet
{
    [Cmdlet(VerbsCommon.Get, "Greeting")]
    [OutputType(typeof(string))]
    public class Greeting: PSCmdlet
    {
        [Parameter(ValueFromPipeline =true,
            Mandatory = true,
            HelpMessage = "Enter a name to greet, e.g. Huber")]
        [Alias("N")]
        public string[] Names { get; set; }

        protected override void ProcessRecord()
        {
            var greeting = "Hello";
            foreach (var name in Names)
            {
                greeting += " " + name;
            }
            WriteObject(greeting);
        }

        protected override void StopProcessing()
        {
            base.StopProcessing();
        }

        protected override void EndProcessing()
        {
            base.EndProcessing();
        }
        protected override void BeginProcessing()
        {
            base.BeginProcessing();
        }

    }
}

