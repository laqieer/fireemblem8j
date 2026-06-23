#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc)
{
    u32 i;
    u16 *dst = !gEkrBg1ScrollFlip
        ? gpBg1ScrollOffsetList2
        : gpBg1ScrollOffsetList1;

    for (i = 0; i < 160; dst++, i++) {
        if (i < 120) {
            s16 ref = gEfxmisc_0[i] * proc->unk44 >> 0xC;

            if (ref) {
                if (i < 60) {
                    if (ref < i - 0x88)
                        ref = i + -0x88;
                } else {
                    if (ref > 0x88 - i)
                        ref = 0x88 - i;
                }
            }
            *dst = ref;
        } else {
            *dst = 0;
        }
    }
}
