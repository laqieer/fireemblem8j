typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;
typedef int s32;

#define TRUE 1
#define FALSE 0

#define EVSUBCMD_TEXTSHOW  0
#define EVSUBCMD_TEXTSHOW2 1
#define EVSUBCMD_REMA      2

#define EV_STATE_0008  (1 << 3)
#define EV_EXEC_CUTSCENE 1
#define EVC_ADVANCE_CONTINUE 0
#define EVC_ADVANCE_YIELD    2

#define STRUCT_PAD(a,b) char pad_##b[b-a];

struct EventEngineProc
{
    char header[0x2C];
    /* 2C */ void (*pCallback)(struct EventEngineProc*);
    /* 30 */ const u16* pEventStart;
    /* 34 */ const u16* pEventIdk;
    /* 38 */ const u16* pEventCurrent;
    /* 3C */ u16 evStateBits;
    /* 3E */ u16 evStallTimer;
    /* 40 */ s8 overwrittenTextSpeed;
    /* 41 */ u8 execType;
    /* 42 */ u8 activeTextType;
    /* 43 */ u8 chapterIndex;
    /* 44 */ u16 mapSpritePalIdOverride;
    /* 46 */ STRUCT_PAD(0x46, 0x48)
    /* 48 */ const void* pUnitLoadData;
    /* 4C */ s16 unitLoadCount;
    /* 4E */ u8  chance;
    /* 4F */ u8 unitLoadParameter : 7;
    /* 4F */ u8 diable_REDA : 1;
    /* 50 */ STRUCT_PAD(0x50, 0x54)
    /* 54 */ void *unit;
};

extern u32 gEventSlots[];

extern void EventText_StartTalkMsg(struct EventEngineProc * proc, u16 stringIndex, s8 b);
extern void EventText_StartCgTextMsg(struct EventEngineProc * proc, u16 stringIndex, u32 flags);
extern void EventText_StartBoxDialogueMsg(struct EventEngineProc * proc, u16 stringIndex, u32 flags);
extern void EndTalk(void);
extern void EndCgText(void);
extern void EndAllBoxDialogue(void);
extern void ChangeUnitSpritePalette(u16 a);
extern void EndEventFaces(struct EventEngineProc * proc);

u8 Event1B_TEXTSHOW(struct EventEngineProc * proc)
{
    u8 subcode = 0xF & *(const u8 *)(proc->pEventCurrent);
    short evArgument = proc->pEventCurrent[1];
    unsigned zeroFlag = 0;
    u16 ea;
    u32 flags;

    if (subcode != 2)
    {
        if (evArgument < 0)
            evArgument = gEventSlots[2];

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
                    ea = evArgument;
                    asm("movs %0, #0x10":"=r"(flags)::"cc");
                    goto label;
                case 4:
                    EventText_StartBoxDialogueMsg(proc, evArgument, zeroFlag);
                    break;
                case 5:
                    ea = evArgument;
                    flags = 0x0010 | 0x0020;
                    goto label;
            }
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
                    ea = evArgument;
                    asm("movs %0, #0x10":"=r"(flags)::"cc");
                    goto label;
                case 4:
                    EventText_StartBoxDialogueMsg(proc, evArgument, zeroFlag);
                    break;
                case 5:
                    ea = evArgument;
                    flags = 0x0010 | 0x0020;
                label:
                    EventText_StartBoxDialogueMsg(proc, ea, flags);
                    break;
            }
            break;

        case EVSUBCMD_REMA:
            proc->evStateBits &= ~EV_STATE_0008;

            EndTalk();
            EndCgText();
            EndAllBoxDialogue();

            if (proc->execType == EV_EXEC_CUTSCENE)
                ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

            EndEventFaces(proc);

            return EVC_ADVANCE_YIELD;
    }

    return EVC_ADVANCE_CONTINUE;
}