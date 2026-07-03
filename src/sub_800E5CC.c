#include "global.h"
#include "proc.h"
#include "event.h"
#include "eventscript.h"
#include "scene.h"
#include "cgtext.h"
#include "helpbox.h"

void EventText_StartTalkMsg(struct EventEngineProc * proc, u16 stringIndex, s8 b);
void EventText_StartCgTextMsg(struct EventEngineProc * proc, u16 stringIndex, u32 flags);
void EventText_StartBoxDialogueMsg(struct EventEngineProc * proc, u16 stringIndex, u32 flags);

//! FE8U = 0x0800E5AC
// Requires -mjp-promote (Makefile) to keep the two identical `case 3` blocks
// duplicated instead of cross-jump-merged, matching the JP branch topology.
// The three inline `lsl/lsr` zero-extends reproduce agbcc's in-place r16 (r1)
// coloring for the `ea` argument on the box-dialogue paths (case 3 x2 + the
// shared case-5 body). Case 5 from both switches jumps to a single `label5`
// body so it emits one block (target `_0800E6E2`, reached from both jump
// tables) that can carry the extend without un-merging.
u8 Event1B_TEXTSHOW(struct EventEngineProc * proc)
{
    u8 subcode = 0xF & *(const u8 *)(proc->pEventCurrent);
    short evArgument = (s16)proc->pEventCurrent[1];
    unsigned zeroFlag = 0;
    u16 ea;
    u32 flags;

    if (subcode != 2)
    {
        if (evArgument < 0)
            evArgument = (s16)gEventSlots[2];

        if (evArgument == 0)
            return EVC_ADVANCE_CONTINUE;
    }

    switch (subcode)
    {

        case EVSUBCMD_TEXTSHOW:
            proc->evStateBits &= ~EV_STATE_0008;

            if ((proc->evStateBits >> 2) & 1)
                break;

            switch (proc->activeTextType)
            {

                case 0:
                    EventText_StartTalkMsg(proc, evArgument, TRUE);
                    break;

                case 1:
                    EventText_StartTalkMsg(proc, evArgument, TRUE);
                    break;

                case 2:
                    EventText_StartCgTextMsg(proc, evArgument, zeroFlag);
                    break;

                case 3:
                    asm("lsl %0, %1, #16\n\tlsr %0, %0, #16":"=&r"(ea):"r"(evArgument):"cc");
                    flags = 0x0010;
                    goto label;

                case 4:
                    EventText_StartBoxDialogueMsg(proc, evArgument, zeroFlag);
                    break;

                case 5:
                    goto label5;

            } // switch (proc->activeTextType)

            break;

        case EVSUBCMD_TEXTSHOW2:
            if ((proc->evStateBits >> 2) & 1)
                break;

            if ((proc->evStateBits >> 3) & 1)
                break;

            switch (proc->activeTextType)
            {

                case 0:
                    EventText_StartTalkMsg(proc, evArgument, FALSE);
                    break;

                case 1:
                    EventText_StartTalkMsg(proc, evArgument, FALSE);
                    break;

                case 2:
                    EventText_StartCgTextMsg(proc, evArgument, zeroFlag);
                    break;

                case 3:
                    asm("lsl %0, %1, #16\n\tlsr %0, %0, #16":"=&r"(ea):"r"(evArgument):"cc");
                    flags = 0x0010;
                    goto label;

                case 4:
                    EventText_StartBoxDialogueMsg(proc, evArgument, zeroFlag);
                    break;

                case 5:
                label5:
                    asm("lsl %0, %1, #16\n\tlsr %0, %0, #16":"=&r"(ea):"r"(evArgument):"cc");
                    flags = 0x0010 | 0x0020;
                label:
                    EventText_StartBoxDialogueMsg(proc, ea, flags);
                    break;

            } // switch (proc->activeTextType)

            break;

        case EVSUBCMD_REMA: // REMA
            proc->evStateBits &= ~EV_STATE_0008;

            EndTalk();
            EndCgText();
            EndAllBoxDialogue();

            if (proc->execType == EV_EXEC_CUTSCENE)
                ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

            EndEventFaces(proc);

            return EVC_ADVANCE_YIELD;

    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}
