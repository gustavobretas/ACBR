﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ACBrLib.Core.CTe
{
    public class CobrCTe
    {
        public FatCTe fat { get; set; } = new FatCTe();

        public List<DupCTe> dup { get; set; } = new List<DupCTe>();
    }
}
