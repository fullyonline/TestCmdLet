using System;
using System.Management.Automation;

namespace TestCmdLet
{
    [Cmdlet(VerbsCommon.Get, "Greeting")]
    public class HelloWorld: PSCmdlet
    {
        [Parameter(ValueFromPipeline =true)]
        public string Name { get; set; }

        protected override void ProcessRecord()
        {
            var whoDat = string.IsNullOrEmpty(Name) ? "World" : Name;
            var greeting = "Hello " + whoDat;

            WriteObject(greeting);
        }
    }
}

