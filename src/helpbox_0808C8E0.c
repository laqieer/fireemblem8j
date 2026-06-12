#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"


extern EWRAM_DATA struct HelpBoxSt gHelpBoxSt;
extern EWRAM_DATA struct HelpBoxInfo gTmpHelpBoxInfo;
extern EWRAM_DATA const struct HelpBoxInfo * gpHelpBoxCurrentInfo;
extern EWRAM_DATA struct BoxDialogueConf gBoxDialogueConf;

/* prototypes for same-file helpers called by this run */
u16 GetDialogueBoxConfig(void);

//! FE8U = 0x0808A5D0
void InitBoxDialogue(void * vram_dst, int pad_idx) {
    int uVar1;
    int iVar3;
    int iVar4;
    int iVar5;

    if (vram_dst == 0) {
        vram_dst = (void *)0x06013000;
    }

    if (pad_idx < 0) {
        pad_idx = 5;
    }

    pad_idx = (pad_idx & 0xf) + 0x10;

    if (GetDialogueBoxConfig() & 0x10) {
        Decompress(gGfx_YellowTextBox, vram_dst + 0x360);
        Decompress(gGfx_YellowTextBox2, vram_dst + 0x760);
        Decompress(gGfx_YellowTextBox3, vram_dst + 0xb60);
        Decompress(gGfx_YellowTextBox4, vram_dst + 0xf80);
        Decompress(gGfx_YellowTextBox5, vram_dst + 0x1380);
    } else {
        Decompress(gGfx_HelpTextBox, vram_dst + 0x360);
        Decompress(gGfx_HelpTextBox2, vram_dst + 0x760);
        Decompress(gGfx_HelpTextBox3, vram_dst + 0xb60);
        Decompress(gGfx_HelpTextBox4, vram_dst + 0xf60);
        Decompress(gGfx_HelpTextBox5, vram_dst + 0x1360);
    }

    ClearAllTalkFlags();

    if (!(GetDialogueBoxConfig() & 1)) {
        InitSpriteTextFont(&gBoxDialogueConf.font, vram_dst, pad_idx);

        InitSpriteText(&gBoxDialogueConf.texts[0]);
        InitSpriteText(&gBoxDialogueConf.texts[1]);
        InitSpriteText(&gBoxDialogueConf.texts[2]);

        if ((GetDialogueBoxConfig() & 0x10) && !(GetDialogueBoxConfig() & 0x20)) {
            InitSpriteText(&gBoxDialogueConf.texts[3]);
            InitSpriteText(&gBoxDialogueConf.texts[4]);
        }

        SetTextFont(0);

        if (GetDialogueBoxConfig() & 0x10) {
            ApplyPalette(gPal_YellowTextBox, pad_idx);
        } else {
            ApplyPalette(gPal_HelpTextBox, pad_idx);
        }

    } else {
        InitSpriteTextFont(&gBoxDialogueConf.font, vram_dst, pad_idx);

        for (iVar4 = 0; iVar4 < ((u16)GetDialogueBoxConfig() >> 8); iVar4++) {
            InitSpriteText(&gBoxDialogueConf.texts[iVar4]);
        }

        SetTextFont(0);

        ApplyPalette(Pal_Text, pad_idx);
    }

    if (&vram_dst)
        gBoxDialogueConf.unk_40 = ((((u32)vram_dst << 0x11) >> 0x16) + (pad_idx & 0xF) * 0x1000);

    if (GetDialogueBoxConfig() & 0x10) {
        PlaySoundEffect(SONG_2E6);
    }

    return;
}
