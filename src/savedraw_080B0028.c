#include "global.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"

//! FE8U = 0x080AB56C
void SaveDraw_UpdateParticles(u32 a) {
    int i;
    struct Unknown020007E0* ptr;

    int count = 0;

    for (i = 0, ptr = gSavedraw_0; i <= 0x13; i++, ptr++) {
        if (ptr->unk_0e != 0) {

            if (ptr->unk_00 + 0xC0 <= 0xC5F) {

                if (ptr->unk_04 <= 0x3BF) {
                    PutSpriteExt(
                        0xe,
                        ((int)ptr->unk_00 / 12) & 0x1FF,
                        (ptr->unk_04 / 12) & 0xff,
                        Sprite_Savedraw_5,
                        0x3000
                    );
                } else {
                    PutSpriteExt(
                        0xe,
                        ((int)ptr->unk_00 / 12) & 0x1FF,
                        (ptr->unk_04 / 12) & 0xff,
                        Sprite_Savedraw_4,
                        0x3000
                    );
                }
            }

            ptr->unk_00 += ptr->unk_08;
            ptr->unk_04 += ptr->unk_0a;

            if ((a & 3) == 0) {
                ptr->unk_08 += ptr->unk_0c;
                ptr->unk_0a += ptr->unk_0d;
            }

            if ((ptr->unk_00 + 0x5a0 > 0x167F)
                || (ptr->unk_04 < -0x3C0)
                || (ptr->unk_04 > 0xB3F)) {
                ptr->unk_0e = 0;
            } else {
                count++;
            }
        }

    }

    if (count < 0x13) {
        for (ptr = gSavedraw_0, i = 0; i <= 0x13; i++, ptr++) {
            if (ptr->unk_0e == 0) {

                if (DivRem(AdvanceGetLCGRNValue(), 0xb) == 0) {
                    ptr->unk_00 = (((DivRem(AdvanceGetLCGRNValue(), 0x11) - 8) * 0x1e)
                        + DivRem(AdvanceGetLCGRNValue(), 0x1f)) * 0xc;
                    ptr->unk_04 = 0x780;
                    ptr->unk_08 = DivRem(AdvanceGetLCGRNValue(), 7) + 6;
                    ptr->unk_0a = -0x18 - DivRem(AdvanceGetLCGRNValue(), 0x19);
                    ptr->unk_0c = DivRem(AdvanceGetLCGRNValue(), 3) + 1;
                    ptr->unk_0d = 0;
                    ptr->unk_0e = 1;
                }

            }
        }
    }

    return;
}
