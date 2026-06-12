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

//! FE8U = 0x0808F358
void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut)
{
    int charWidth;

    int w = 0;
    int h = *hOut;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
            case 0x00: // [X]
            case 0x03: // [A]
            case 0x18: // [Yes]
            case 0x19: // [No]
                *wOut = w;
                *hOut = h;

                return;

            case 0x02: // [NL2]
            case 0x04: // [....]
            case 0x05: // [.....]
            case 0x06: // [......]
            case 0x07: // [.......]
            case 0x16: // [ToggleMouthMove]
            case 0x17: // [ToggleSmile]
                str++;

                continue;

            case 0x01: // [NL]
                str++;
                h += 16;
                w = 0;

                continue;

            case 0x80:
                str += 2;

                continue;

            default:
                str = GetCharTextLen(str, &charWidth);
                w += charWidth;

                continue;
        }
    }

    return;
}
