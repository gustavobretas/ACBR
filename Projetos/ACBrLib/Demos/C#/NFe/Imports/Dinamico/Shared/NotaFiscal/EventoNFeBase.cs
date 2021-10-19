﻿using ACBrLib.Core.DFe;

namespace ACBrLib.NFe
{
    public abstract class EventoNFeBase : EventoBase<TipoEventoNFe>
    {
        #region Properties

        public string chNFe { get; set; }

        #endregion Properties
    }
}