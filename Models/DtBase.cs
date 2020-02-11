using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SimpleAPI.Models
{
    public partial class DtBase
    {
        public DtBase()
        {
            DtTech = new HashSet<DtTech>();
        }

        [Key]
        public string Object_Uid { get; set; }
        public string Object_Uid_Oper { get; set; }
        public string Dt_Geo_Object_GeoUid { get; set; }
        public short? Fk_Ref_MediaType_Id { get; set; }
        public int? Fk_Ref_MediaNetwork_Id { get; set; }
        public int? Fk_Ref_Partner_Id { get; set; }
        public int? Fk_Ref_UrFace_Id { get; set; }
        public int? Fk_Ref_License_Id { get; set; }
        public string Legacy_Id { get; set; }
        public string Common_Id { get; set; }
        public string ObjectName { get; set; }
        public string Reference { get; set; }
        public string Url_Photo { get; set; }
        public string Url_Schema { get; set; }
        public string Url_Presentation { get; set; }
        public int? Autor_Id { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime LastUpdate { get; set; }
        public bool Deleted { get; set; }
        public DateTime? DateDelete { get; set; }

        [ForeignKey("Fk_Ref_MediaType_Id")]
        public virtual RefMediaType FkMediaType { get; set; }
        public virtual ICollection<DtTech> DtTech { get; set; }
    }
}
