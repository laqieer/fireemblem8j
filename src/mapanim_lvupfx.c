#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ap.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "mapanim.h"
#include "bmlib.h"

void StartManimLevelUpStatGainLabels(int chr, int pal, int sprite_layer, ProcPtr parent)
{
    struct ManimLevelUpStatGainLabelProc * proc_a;
    struct ManimLevelUpLabelColorProc * proc_b;

    proc_a = Proc_Start(ProcScr_ManimLevelUpStatGainLabel, parent);

    proc_a->chr = chr;
    proc_a->pal = pal;
    proc_a->sprite_layer = sprite_layer;

    Decompress(Img_ManimLevelUpStatGain, OBJ_VRAM0 + (OAM2_CHR(chr) << 5));
    ApplyPalette(Pal_ManimLevelUp, 0x10 + pal);
    ApplyPalette(Pal_ManimLevelUp, 0x10 + pal + 1);

    proc_b = Proc_Start(ProcScr_ManimLevelUpLabelColor, proc_a);
    proc_b->pal = pal;
}

void EndManimLevelUpStatGainLabels(void)
{
    Proc_EndEach(ProcScr_ManimLevelUpStatGainLabel);
}

void StartManimLevelUpStatGainLabelAnim(int x, int y, int stat_num, int stat_gain)
{
    int stat_loss;
    int chr_common, chr_this_stat;
    struct ManimLevelUpStatGainLabelProc * proc;
    u8 *digits_chr = Img_ManimLevelUpStatGainDigits;

    proc = Proc_Find(ProcScr_ManimLevelUpStatGainLabel);
    chr_common = proc->chr;
    chr_this_stat = proc->chr + (stat_num - 1) * 2;

    if (stat_num == 0) {
        APProc_Create(SpriteAnim_ManimStatGain,
            x - 18, y - 4,
            OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
            0, 2);
    } else {
        if (stat_gain > 0)
            stat_loss = 0;
        else
            stat_loss = 1;

        APProc_Create(SpriteAnim_ManimStatGain,
            x, y,
            OAM2_PAL(proc->pal + stat_loss) + chr_common + OAM2_LAYER(proc->sprite_layer),
            1 + stat_loss, 2);

        APProc_Create(SpriteAnim_ManimStatGain,
            x - 3, y,
            OAM2_PAL(proc->pal) + chr_this_stat + OAM2_LAYER(proc->sprite_layer),
            3 + stat_loss, 2);

        if (stat_gain > 0) {
            APProc_Create(SpriteAnim_ManimStatGain,
                x - 18, y - 4,
                OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
                0, 2);
        }

        if (stat_gain < 0) {
            VramCopy(digits_chr + 0x20 * CHR_SIZE,
                OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4C) << 5), CHR_SIZE);
        }

        VramCopy(digits_chr + (OAM2_CHR(ABS(stat_gain)) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x2D) << 5), CHR_SIZE);

        VramCopy(digits_chr + (OAM2_CHR(ABS(stat_gain) + 0x20) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4D) << 5), CHR_SIZE);
    }
}

void StartPrepItemBoostStatGainLabelAnim(int x, int y, int stat_gain)
{
    int chr_common, chr_this_stat, stat_abs, stat_loss;
    struct ManimLevelUpStatGainLabelProc * proc;
    u8 *digits_chr = Img_ManimLevelUpStatGainDigits;

    stat_abs = ABS(stat_gain);
    proc = Proc_Find(ProcScr_ManimLevelUpStatGainLabel);
    chr_common = proc->chr;

    if (stat_gain >= 0) {
        chr_this_stat = chr_common + 2 * (stat_abs - 1);
        stat_loss = 5;
    } else {
        chr_this_stat = chr_common +16;
        stat_loss = 6;
    }

    APProc_Create(SpriteAnim_ManimStatGain,
        x, y,
        chr_common + OAM2_PAL(proc->pal) + OAM2_LAYER(proc->sprite_layer),
        stat_loss, 2);

    APProc_Create(SpriteAnim_ManimStatGain,
        x - 3, y,
        chr_this_stat + OAM2_PAL(proc->pal) + OAM2_LAYER(proc->sprite_layer),
        3, 2);


    APProc_Create(SpriteAnim_ManimStatGain,
        x - 18, y - 4,
        chr_common + OAM2_PAL(proc->pal) + OAM2_LAYER(proc->sprite_layer),
        0, 2);

    VramCopy(digits_chr + (OAM2_CHR(stat_abs) << 5),
        OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x2D) << 5), CHR_SIZE);

    VramCopy(digits_chr + (OAM2_CHR(stat_abs + 0x20) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4D) << 5), CHR_SIZE);
}
