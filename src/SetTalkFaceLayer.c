#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

extern struct TalkState* sTalkState;

//! FE8U = 0x0800798C
void SetTalkFaceLayer(int talkFace, int toBack) {
    int i;
    int iStart;
    int iEnd;
    int argLayer;
    int otherLayer;

    if (toBack != 0) {
        return;
    }

    argLayer = 5;
    otherLayer = 6;

    switch (talkFace) {
        case 0:
        case 1:
        case 2:
        default:
            iStart = 0;
            iEnd = 2;
            break;

        case 3:
        case 4:
        case 5:
            iStart = 3;
            iEnd = 5;
            break;
    }

    for (i = iStart; i <= iEnd; i++) {
        if (!sTalkState->faces[i]) {
            continue;
        }

        if (i == talkFace) {
            sTalkState->faces[i]->spriteLayer = argLayer;
        } else {
            sTalkState->faces[i]->spriteLayer = otherLayer;
        }
    }

    return;
}
