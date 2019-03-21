using System;
using System.Collections.Generic;

namespace TestEFCore.Model
{
    public partial class User
    {
        public User()
        {
            UserProfile = new HashSet<UserProfile>();
        }

        public long Id { get; set; }
        public long UserTypeIdc { get; set; }
        public long StatusIdc { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Code { get; set; }
        public string FirebaseMessageId { get; set; }

        public virtual ICollection<UserProfile> UserProfile { get; set; }
    }
}
