using System;
using System.Collections.Generic;

namespace TestEFCore.Model
{
    public partial class Module
    {
        public Module()
        {
            Option = new HashSet<Option>();
        }

        public long Id { get; set; }
        public long TypeAppIdc { get; set; }
        public long StatusIdc { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public int Priority { get; set; }

        public virtual ICollection<Option> Option { get; set; }
    }
}
