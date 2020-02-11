using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SimpleAPI.Models
{
    public partial class RefMediaType
    {
        public RefMediaType()
        {
            DtBase = new HashSet<DtBase>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public short MediaType_Id { get; set; }
        public short Fk_Ref_MediaGroup_Id { get; set; }
        public string MediaType { get; set; }
        public DateTime LastUpdated { get; set; }
        public bool Deleted { get; set; }

        public virtual ICollection<DtBase> DtBase { get; set; }
    }
}
