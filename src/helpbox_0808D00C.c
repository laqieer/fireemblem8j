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

//! FE8U = 0x0808ACFC
void PutBoxDialogueBoxSprites(int x, int y, int width, int height) {
    int i, j, l;
    int spriteWidth, spriteHeight;
    int sp14 = height >> 5;

    if (width < 0x20) width = 0x20;
    if (width > 0xc0) width = 0xc0;
    if (height < 0x10) height = 0x10;
    if (height > 0x50) height = 0x50;

    if (!(GetDialogueBoxConfig() & 1)) {
        spriteHeight = (height + 0xF) / 0x10;
        spriteWidth = (width + 7) / 8 + 1;

        for (i = 0; i < spriteWidth - 4; i += 4) {
            l = 8 * i;
            for (j = spriteHeight; j >= 0; j -= 1) {
                int k = 0x10 * (j + 1);
                if (k > height) k = height;
                k -= 0x10;
                PutSprite(2, x + l, y + k, gObject_32x16, gBoxDialogueConf.unk_40 + i + j * 0x40);
            }
        }

        for (; i < spriteWidth; i += 1) {
            l = 8 * i;
            for (j = spriteHeight; j >= 0; j -= 1) {
                int k = 0x10 * (j + 1);
                if (k > height) k = height;
                k -= 0x10;
                if (i < spriteWidth - 2) {
                    PutSprite(2, x + l, y + k, gObject_16x16, gBoxDialogueConf.unk_40 + i + j * 0x40);
                } else {
                    PutSprite(2, x + l, y + k, gObject_8x16, gBoxDialogueConf.unk_40 + i + j * 0x40);
                }
            }
            if (i < spriteWidth - 2) i += 1;
        }

        for (i = 0; i < spriteWidth; i += 1) {
            l = 8 * i;
            if (i < spriteWidth - 2) {
                PutSprite(2, x + l, y - 8, gObject_16x8, gBoxDialogueConf.unk_40 + 0x1B + (!((i + 6) % 10) ? 2 : 0));
                PutSprite(2, x + l, y + height, gObject_16x8, gBoxDialogueConf.unk_40 + 0x3B + (!((i + 6) % 8) ? 2 : 0));
                i += 1;
            } else {
                PutSprite(2, x + l, y - 8, gObject_8x8, gBoxDialogueConf.unk_40 + 0x1B);
                PutSprite(2, x + l, y + height, gObject_8x8, gBoxDialogueConf.unk_40 + 0x3B);
            }
        }

        if (GetDialogueBoxConfig() & 0x10) {
            for (j = spriteHeight; j >= 0; j -= 1) {
                int k = 0x10 * (j + 1);
                if (k > height) k = height;
                k -= 0x10;
                PutSprite(2, x - 8, y + k, gObject_8x16, gBoxDialogueConf.unk_40 + (j & 1 ? 0x7F : 0x5F));
                PutSprite(2, x + 8 * i, y + k, gObject_8x16, gBoxDialogueConf.unk_40 + (j == sp14 ? 0x7E : 0x1F));
            }
        } else {
            for (j = spriteHeight; j >= 0; j -= 1) {
                int k = 0x10 * (j + 1);
                if (k > height) k = height;
                k -= 0x10;
                PutSprite(2, x - 8, y + k, gObject_8x16, gBoxDialogueConf.unk_40 + 0x5F);
                PutSprite(2, x + 8 * i, y + k, gObject_8x16, gBoxDialogueConf.unk_40 + 0x1F);
            }
        }

        PutSprite(2, x - 8, y - 8, gObject_8x8, gBoxDialogueConf.unk_40 + 0x5B);
        PutSprite(2, x + 8 * i, y - 8, gObject_8x8, gBoxDialogueConf.unk_40 + 0x5C);
        PutSprite(2, x - 8, y + height, gObject_8x8, gBoxDialogueConf.unk_40 + 0x5D);
        PutSprite(2, x + 8 * i, y + height, gObject_8x8, gBoxDialogueConf.unk_40 + 0x5E);
    } else {
        spriteWidth = (width + 0x1f) / 0x20;
        spriteHeight = GetDialogueBoxConfig() / 0x100 - 1;

        for (i = spriteWidth - 1; i >= 0; i -= 1) {
            for (j = spriteHeight; j >= 0; j -= 1) {
                int k;
                l = 0x20 * i;
                k = 0x10 * j;
                PutSprite(2, x + l, y + k, gObject_32x16, gBoxDialogueConf.unk_40 + 4 * i + j * 0x40);
            }
        }
    }

    return;
}
