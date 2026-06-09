#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "chapterdata.h"
#include "playerphase.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "gba_sprites.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/video-global.h"
#include "constants/songs.h"



























































































/* prototypes for same-file helpers called by this run */
void DisplayMapClearMapAnim(ProcPtr proc);
void DisplayEventMapAnim(ProcPtr parent, int val);

/* Display the "Map Clear!"" Effect (From the Tower of Valni and Lagdou Ruins) */
void DisplayMapClearMapAnim(ProcPtr proc)
{
    DisplayEventMapAnim(proc, 1);
}

void DisplayCongratulationsMapAnim(ProcPtr proc)
{
    DisplayEventMapAnim(proc, 0);
}
