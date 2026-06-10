/* TU-private data externs bound at their JP addresses */
extern struct TalkState* sTalkState;
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

//! FE8U = 0x08007938
ProcPtr StartTalkFace(int faceId, int x, int y, int disp, int talkFace) {
    sTalkState->faces[talkFace] = StartFaceAuto(faceId, x, y, disp);

    return sTalkState->faces[talkFace];
}
