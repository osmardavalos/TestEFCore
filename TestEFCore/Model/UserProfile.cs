using System;
using System.Collections.Generic;

namespace TestEFCore.Model
{
    public partial class UserProfile
    {
        public long UserId { get; set; }
        public long ProfileId { get; set; }

        public virtual Profile Profile { get; set; }
        public virtual User User { get; set; }
    }
}
