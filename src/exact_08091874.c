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



// clang-format off





//! FE8U = 0x0808F5A0
s8 DoesStringContainTact(const char * str)
{
    while (1)
    {
        switch (*str)
        {
            case 0x00: // [X]
                return 0;

            case 0x80:
                str++;

                if (*str == 0x20) // [Tact]
                {
                    return 1;
                }
        }

        str++;
    }
}
