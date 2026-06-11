#include "global.h"
#include "ctc.h"
#include "scene.h"
#include "hardware.h"
#include "worldmap.h"

//! FE8U = 0x080C36A0
void StartWmTextMsg(int textId)
{
    EndTalk();

    InitSpriteTalk(0x200, 2, 2);
    EnablePaletteSync();

    StartTalkMsg(1, 15, textId);

    SetTalkPrintDelay(4);

    SetTalkFlag(TALK_FLAG_SPRITE);
    SetTalkFlag(TALK_FLAG_7);
    SetTalkFlag(TALK_FLAG_NOSKIP);
    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);

    return;
}
