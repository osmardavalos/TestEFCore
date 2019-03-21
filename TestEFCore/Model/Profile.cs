using System;
using System.Collections.Generic;

namespace TestEFCore.Model
{
    public partial class Profile
    {
        public Profile()
        {
            ProfileOption = new HashSet<ProfileOption>();
            UserProfile = new HashSet<UserProfile>();
        }

        public long Id { get; set; }
        public long StatusIdc { get; set; }
        public string Name { get; set; }

        public virtual ICollection<ProfileOption> ProfileOption { get; set; }
        public virtual ICollection<UserProfile> UserProfile { get; set; }
    }
}
