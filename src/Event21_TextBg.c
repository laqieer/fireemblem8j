#include "global.h"
#include "proc.h"
#include "event.h"
#include "eventscript.h"
#include "colorfade.h"

u8 Event21_TextBg(struct EventEngineProc * proc)
{
    u16 evArgument2_a, evArgument2_b, evArgument3;
    struct ConvoBackgroundFadeProc * otherProc;

    int subcode = EVT_SUB_CMD(proc->pEventCurrent);
    int evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = (s16)gEventSlots[2];

    switch (subcode) {
    case EVSUBCMD_BACG:
        return EventShowTextBgDirect(proc->activeTextType, evArgument);

    case EVSUBCMD_0x2141:
        evArgument2_a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
        evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

        switch (proc->activeTextType) {
        case 0:
        case 3:
        case 4:
        case 5:
            switch (evArgument2_a)
            {

                case EVSUBCMD_TEXTSTART:
                case EVSUBCMD_TUTORIALTEXTBOXSTART:
                case EVSUBCMD_SOLOTEXTBOXSTART:
                case EVSUBCMD_0x1A25:
                    return EVC_ERROR;

                case EVSUBCMD_REMOVEPORTRAITS:
                case EVSUBCMD_0x1A22:
                    if (EVENT_IS_SKIPPING(proc))
                        return EVC_ADVANCE_CONTINUE;

                    otherProc = Proc_StartBlocking(gEventscr_3, proc);
                    otherProc->fadeType = 1;

                    break;

            } // switch (a)

            break;

        case EVSUBCMD_0x2141:
        case EVSUBCMD_2142:
            switch (evArgument2_a) {
            case 0:
            case 3:
            case 4:
            case 5:
                if (EVENT_IS_SKIPPING(proc))
                    return Event22_ClearScreen(proc); // CLEAN

                otherProc = Proc_StartBlocking(gEventscr_4, proc);
                otherProc->fadeType = 2;

                break;

            case 1:
            case 2:
                if (EVENT_IS_SKIPPING(proc))
                    return EVC_ADVANCE_CONTINUE;

                otherProc = Proc_StartBlocking(gEventscr_1, proc);
                otherProc->fadeType = 0;

                break;
            }

            break;
        }

            otherProc->unkType = evArgument2_a;
            otherProc->bgIndex = evArgument;
            otherProc->fadeSpeed = evArgument3;
            otherProc->fadeTimer = 0;
            otherProc->pEventEngine = proc;
            break;

        case EVSUBCMD_2142:
            evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            if (EventShowTextBgDirect(proc->activeTextType, evArgument) == EVC_ERROR)
                return EVC_ERROR;

            NewColFadeIn(evArgument3, 0, evArgument2_b, proc);

            break;

        case EVSUBCMD_2143:
            evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            NewColFadeOut(evArgument3, 0, evArgument2_b, proc);

            break;
    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}
