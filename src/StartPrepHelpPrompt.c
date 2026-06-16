#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"

extern struct ProcCmd gProcScr_PrepHelpPrompt[];

void StartPrepHelpPrompt(ProcPtr proc)
{
    Proc_Start(gProcScr_PrepHelpPrompt, proc);
}
