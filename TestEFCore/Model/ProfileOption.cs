using System;
using System.Collections.Generic;

namespace TestEFCore.Model
{
    public partial class ProfileOption
    {
        public long ProfileId { get; set; }
        public long OptionId { get; set; }

        public virtual Option Option { get; set; }
        public virtual Profile Profile { get; set; }
    }
}
