using System;
using System.Collections.Generic;

namespace TestEFCore.Model
{
    public partial class Option
    {
        public Option()
        {
            ProfileOption = new HashSet<ProfileOption>();
        }

        public long Id { get; set; }
        public long ModuleId { get; set; }
        public long StatusIdc { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public string Url { get; set; }
        public int ListOrder { get; set; }

        public virtual Module Module { get; set; }
        public virtual ICollection<ProfileOption> ProfileOption { get; set; }
    }
}
