#include "global.h"
#include "bb.h"

/* The function-local static lut[] is the JP-carved region-different data at
 * 0x085C6690 (named `lut.29` by the data carve). Reference it as an extern so
 * the literal pool relocates against that fixed address instead of emitting a
 * private copy. */
extern const u8 SubtitleHelp_TextShowLut[];

void SubtitleHelp_Loop(struct SubtitleHelpProc * proc)
{
    PutSubtitleHelpText(proc, SubtitleHelp_TextShowLut[proc->textShowCnt]);

    if (proc->textShowCnt != 0) {
        proc->textShowCnt--;
    }

    proc->textOffset--;

    if (proc->textOffset < 0) {
        proc->textOffset = 31;
        proc->textNum++;
    }

    return;
}
