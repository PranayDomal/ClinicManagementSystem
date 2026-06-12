using ClinicManagementSystem.Models;
using Microsoft.EntityFrameworkCore;

namespace ClinicManagementSystem.Repository
{
    public class AppDbContext:DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Patient> Patients { get; set; }
    }
}
