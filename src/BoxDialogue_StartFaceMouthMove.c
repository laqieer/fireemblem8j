extern int GetDialogueBoxConfig();
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

//! FE8U = 0x0808B0F8
void BoxDialogue_StartFaceMouthMove(void) {

    if (GetDialogueBoxConfig() & 4) {
        SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) | 0x10);
    }

    return;
}
