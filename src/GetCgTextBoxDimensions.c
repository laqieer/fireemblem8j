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

//! FE8U = 0x0808F428
void GetCgTextBoxDimensions(const char * str, int * wOut, int * hOut)
{
    int charWidth;

    int w = 0;
    int h = 16;

    *wOut = 0;
    *hOut = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
            case 0x03: // [A]
                w += 8;

            case 0x00: // [X]
            case 0x01: // [NL]
            case 0x02: // [2NL]
            case 0x18: // [Yes]
            case 0x19: // [No]
                if (*wOut < w)
                {
                    *wOut = w;
                }

                w = 0;

                break;
        }

        switch (*str)
        {
            case 0x01: // [NL]
            case 0x18: // [Yes]
            case 0x19: // [No]
                h += 16;

                break;

            case 0x00: // [X]
            case 0x02: // [2NL]
                if (*hOut < h)
                {
                    *hOut = h;
                }

                h = 0;

                break;
        }

        switch (*str)
        {
            case 0x00: // [X]
                return;

            case 0x01: // [NL]
            case 0x02: // [NL2]
            case 0x03: // [A]
            case 0x04: // [....]
            case 0x05: // [.....]
            case 0x06: // [......]
            case 0x07: // [.......]
            case 0x16: // [ToggleMouthMove]
            case 0x17: // [ToggleSmile]
            case 0x18: // [Yes]
            case 0x19: // [No]
                str++;

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
