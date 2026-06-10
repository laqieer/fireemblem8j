#include "global.h"
#include "functions.h"
#include "m4a.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "uiselecttarget.h"
#include "constants/songs.h"



ProcPtr NewTargetSelection_Specialized(const struct SelectInfo* selectInfo, u8(*onSelect)(ProcPtr, struct SelectTarget*)) {
    struct SelectTargetProc* proc = NewTargetSelection(selectInfo);

    proc->onAPress = onSelect;

#if 0
    return proc; // BUG
#endif
}
