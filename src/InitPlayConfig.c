#include "global.h"
#include "chapterdata.h"

void InitPlayConfig(int isDifficult, s8 unk)
{
    CpuFill16(0, &gPlaySt, sizeof(gPlaySt));

    gPlaySt.chapterIndex = 0;

    if (isDifficult)
        gPlaySt.chapterStateBits |= PLAY_FLAG_HARD;

    // TODO: WHAT ARE THOSE
    gPlaySt.config.controller = unk;
    gPlaySt.config.animationType = 0;
    gPlaySt.config.disableTerrainDisplay = 0;
    gPlaySt.config.unitDisplayType = 0;
    gPlaySt.config.autoCursor = 0;
    gPlaySt.config.textSpeed = 1;
    gPlaySt.config.gameSpeed = 0;
    gPlaySt.config.disableBgm = 0;
    gPlaySt.config.disableSoundEffects = 0;
    gPlaySt.config.windowColor = 0;
    gPlaySt.config.disableAutoEndTurns = 0;
    gPlaySt.config.noSubtitleHelp = 0;
    gPlaySt.config.battleForecastType = 0;
    gPlaySt.config.debugControlRed = 0;
    gPlaySt.config.debugControlGreen = 0;
    gPlaySt.config.unitColor = 0;
    gPlaySt.config.unk41_5 = 0;
}
