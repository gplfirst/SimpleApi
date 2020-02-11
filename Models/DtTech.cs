using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SimpleAPI.Models
{
    public partial class DtTech
    {
        [Key]
        public string Dt_Base_Object_Uid { get; set; }
        public short Version { get; set; }
        public DateTime EntryDate { get; set; }
        public int? Autor_Id { get; set; }
        public int? Fk_Ref_Exposition_Type_Id { get; set; }
        public int? Fk_Ref_SideType_Id { get; set; }
        public int? Fk_Ref_Side_Id { get; set; }
        public int? Fk_Ref_Size_Id { get; set; }
        public short? Fk_Ref_ConstrType_Id { get; set; }
        public int? Fk_V_Ref_InstallationTypeId { get; set; }
        public int? Fk_V_Ref_PlacementTypeId { get; set; }
        public decimal? Width { get; set; }
        public decimal? Height { get; set; }
        public string Requirements { get; set; }
        public string Image { get; set; }
        public string Materials { get; set; }
        public byte? Light { get; set; }
        public double? Param01 { get; set; }
        public double? Param02 { get; set; }
        public double? Param03 { get; set; }
        public double? Param04 { get; set; }

        [ForeignKey("Dt_Base_Object_Uid")]
        public virtual DtBase FkDtBase { get; set; }
    }
}
