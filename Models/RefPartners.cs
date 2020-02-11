using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SimpleAPI.Models
{
    public partial class RefPartners
    {
        [Key]
        public int Partner_Id { get; set; }
        public int? Fk_Ref_Partner_Id { get; set; }
        public string PartnerName { get; set; }
        public string PartnerNameFull { get; set; }
        public string Synonyms { get; set; }
        public int Status_Id { get; set; }
        public bool IsClient { get; set; }
        public bool IsSupplier { get; set; }
        public bool IsOpex { get; set; }
        public bool IsCompetitor { get; set; }
        public bool IsCarrier { get; set; }
        public int MainEmployer_Id { get; set; }
        public bool WithoutContractSupplier { get; set; }
        public bool WithoutContractClient { get; set; }
        public int? Category_Clnt_Id { get; set; }
        public int? Category_Supp_Id { get; set; }
        public bool IsPrivatePerson { get; set; }
        public string Pp_Sex { get; set; }
        public DateTime? Pp_Birthday { get; set; }
        public string Keywords { get; set; }
        public string Category_Clnt_Comment { get; set; }
        public string Category_Supp_Comment { get; set; }
        public string Comments { get; set; }
        public string Conditions { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime LastUpdate { get; set; }
        public bool Deleted { get; set; }
    }
}
