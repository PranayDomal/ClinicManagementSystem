using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;

namespace ClinicManagementSystem.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; }

        [Required]
        [StringLength(100)]
        [Column("Name")]
        public required string Name { get; set; }

        [Required]
        [EmailAddress]
        [Column("Email")]
        public required string Email { get; set; }

        [Required]
        [Column("PasswordHash")]
        public required string PasswordHash { get; set; }

        [Required]
        [Column("RoleId")]
        public int RoleId { get; set; }

        [Column("IsActive")]
        public bool IsActive { get; set; }

        [Column("CreatedAt")]
        public DateTime CreatedAt { get; set; }

        public required Role Role { get; set; }
    }
}
