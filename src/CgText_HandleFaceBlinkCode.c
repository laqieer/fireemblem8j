#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"

//! FE8U = 0x0808F824
s8 CgText_HandleFaceBlinkCode(int textCode)
{
    switch (textCode)
    {
        case 0x16: // [EnableBlinking]
            SetFaceBlinkControlById(0, 0);
            return 1;

        case 0x17: // ?
            SetFaceBlinkControlById(0, 1);
            return 1;

        case 0x18: // [DelayBlinking]
            SetFaceBlinkControlById(0, 3);
            return 1;

        case 0x19: // [PauseBlinking]
            SetFaceBlinkControlById(0, 2);
            return 1;

        case 0x1a: // ?
            SetFaceBlinkControlById(0, 4);
            return 1;

        case 0x1b: // [DisableBlinking]
            SetFaceBlinkControlById(0, 5);
            return 1;

        case 0x1c: // [OpenEyes]
            SetFaceEyeControlById(0, 0);
            return 1;

        case 0x1d: // [CloseEyes]
            SetFaceEyeControlById(0, 2);
            return 1;

        case 0x1e: // [HalfCloseEyes]
            SetFaceEyeControlById(0, 3);
            return 1;

        case 0x1f: // [Wink]
            SetFaceEyeControlById(0, 4);
            return 1;
    }

    return 0;
}
