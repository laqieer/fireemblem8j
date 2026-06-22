/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_Talk[];
extern struct Font sTalkFont;
extern struct TalkState* sTalkState;
extern struct Text sTalkText[];
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

//! FE8U = 0x08007758
void TalkLoadFace(ProcPtr proc) {
    int faceDisp = 0;
    int faceId;

    if (sTalkState->activeFaceSlot == 0xFF) {
        SetActiveTalkFace(1);
    }

    if ((s8)IsBattleDeamonActive()) {
        SetupFaceGfxDataInBanim();
    } else {
        faceDisp |= FACE_DISP_KIND(FACE_96x80);
    }

    if (GetTalkFaceHPos(sTalkState->activeFaceSlot) <= 14) {
        faceDisp |= FACE_DISP_FLIPPED;
    }

    faceId = sTalkState->str[0];
    faceId = (sTalkState->str[1] * 0x100) + faceId;

    if (faceId == 0xFFFF) {
        faceId = GetUnitPortraitId(gActiveUnit);
    } else {
        faceId = faceId - 0x100;
    }

    if (sTalkState->faces[sTalkState->activeFaceSlot] != NULL) {
        StartFaceChange(sTalkState->faces[sTalkState->activeFaceSlot], faceId);
        return;
    }

    sTalkState->faces[sTalkState->activeFaceSlot] = StartFaceAuto(faceId, GetTalkFaceHPos(sTalkState->activeFaceSlot) * 8, 80, faceDisp);

    StartFaceFadeIn(sTalkState->faces[sTalkState->activeFaceSlot]);

    SetTalkFaceLayer(sTalkState->activeFaceSlot, CheckTalkFlag(TALK_FLAG_4));
    StartTemporaryLock(proc, 8);

    return;
}
