using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ClinicManagementSystem.Models
{
    public class Patient
    {
        [Key]
        public int PatientId { get; set; }

        [Required]
        [Column("UserId")]
        public int UserId { get; set; }

        [Column("Address")]
        public required string Address { get; set; }

        [Column("City")]
        public required string City { get; set; }

        [Column("State")]
        public required string State { get; set; }

        [Column("DOB")]
        public required DateTime? DOB { get; set; }

        [Column("IdentificationType")]
        public required string IdentificationType { get; set; }

        [Column("IdentificationNumber")]
        public required string IdentificationNumber { get; set; }

        [Column("Phone")]
        public required string Phone { get; set; }

        [Column("Occupation")]
        public required string Occupation { get; set; }

        [Column("MaritalStatus")]
        public required string MaritalStatus { get; set; }

        [Column("SpouseName")]
        public required string SpouseName { get; set; }

        [Column("EmergencyContact")]
        public required string EmergencyContact { get; set; }

        [Column("EmergencyRelation")]
        public required string EmergencyRelation { get; set; }

        public required User User { get; set; }
    }
}
