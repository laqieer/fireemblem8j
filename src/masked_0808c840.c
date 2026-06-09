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





EWRAM_DATA struct BoxDialogueConf gBoxDialogueConf = { 0 };

/* prototypes for same-file helpers called by this run */
u16 GetDialogueBoxConfig(void);

//! FE8U = 0x0808A530
void ScrollBoxDialogueTilesUp(int a, int b) {
    int* ptr, *r4;
    int i, j, k;

    ptr = (int*)((((0x3FF & gBoxDialogueConf.unk_40) + gBoxDialogueConf.texts[0].chr_position) * 0x20) + 0x06010000);

    for (i = 0; i < b*2; i++) {
        r4 = ptr;
        for (j = 0; j < a; j++) {
            for (k = 0; k <= 6; k++) {
                r4[0] = r4[1];
                ++r4;
            }

            if (i == (b*2 - 1)) {

                if ((GetDialogueBoxConfig() & 1) == 0) {
                    *r4++ = 0x44444444;
                } else {
                    *r4++ = 0;
                }

            } else {
                *r4++ = *(ptr + ((j + 0x20) << 3));
            }

        }

        ptr = ptr + 0x100;
    }

    return;
}
