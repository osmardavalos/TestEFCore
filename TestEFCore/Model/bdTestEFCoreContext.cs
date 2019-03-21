using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TestEFCore.Model
{
    public partial class bdTestEFCoreContext : DbContext
    {
        public bdTestEFCoreContext()
        {
        }

        public bdTestEFCoreContext(DbContextOptions<bdTestEFCoreContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Module> Module { get; set; }
        public virtual DbSet<Option> Option { get; set; }
        public virtual DbSet<Profile> Profile { get; set; }
        public virtual DbSet<ProfileOption> ProfileOption { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserProfile> UserProfile { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=bdTestEFCore; user id=sa; password=sa123*;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.3-servicing-35854");

            modelBuilder.Entity<Module>(entity =>
            {
                entity.ToTable("Module", "Security");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Icon)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Option>(entity =>
            {
                entity.ToTable("Option", "Security");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Icon)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Url)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.HasOne(d => d.Module)
                    .WithMany(p => p.Option)
                    .HasForeignKey(d => d.ModuleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Option_Module");
            });

            modelBuilder.Entity<Profile>(entity =>
            {
                entity.ToTable("Profile", "Security");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProfileOption>(entity =>
            {
                entity.HasKey(e => new { e.ProfileId, e.OptionId });

                entity.ToTable("ProfileOption", "Security");

                entity.HasOne(d => d.Option)
                    .WithMany(p => p.ProfileOption)
                    .HasForeignKey(d => d.OptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProfileOption_Option");

                entity.HasOne(d => d.Profile)
                    .WithMany(p => p.ProfileOption)
                    .HasForeignKey(d => d.ProfileId)
                    .HasConstraintName("FK_ProfileOption_Profile");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User", "Security");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.FirebaseMessageId)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Login)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<UserProfile>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.ProfileId });

                entity.ToTable("UserProfile", "Security");

                entity.HasOne(d => d.Profile)
                    .WithMany(p => p.UserProfile)
                    .HasForeignKey(d => d.ProfileId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserProfile_Profile");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserProfile)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserProfile_User");
            });
        }
    }
}
