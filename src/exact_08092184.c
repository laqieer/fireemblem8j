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





//! FE8U = 0x0808FEA4
void CgText_ScrollVramUp(int * src, int x, int y)
{
    int i;
    int ix;
    int iy;

    int * srcPtr = src;

    for (iy = 0; iy < y; iy++)
    {
        int * srcPtr_ = srcPtr;

        for (ix = 0; ix < x; ix++)
        {
            for (i = 0; i < 7; i++)
            {
                srcPtr_[0] = srcPtr_[1];
                srcPtr_++;
            }

            if (iy == y - 1)
            {
                srcPtr_[0] = 0;
                srcPtr_++;
            }
            else
            {
                int tmp = ix + 0x20;
                srcPtr_[0] = srcPtr[tmp * 8];
                srcPtr_++;
            }
        }

        srcPtr += 0x100;
    }

    return;
}
