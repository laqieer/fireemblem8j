#include "global.h"

#include "scene.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmio.h"

extern struct TalkState * sTalkState;

//! FE8U = 0x08008B44
int GetStrTalkLen(const char * str, int isBubbleOpen)
{
    char buf[0x20];
    int chrLen;
    int speakFace;
    int activeFace;
    int currentLineLen;
    int maxLineLen;

    isBubbleOpen = (s8)isBubbleOpen;

    speakFace = sTalkState->speakingFaceSlot;
    activeFace = sTalkState->activeFaceSlot;

    currentLineLen = 0;
    maxLineLen = 24;

    while (1) {
        switch (*str) {
            case 0x00:
            case 0x15:

                if (currentLineLen > maxLineLen) {
                    maxLineLen = currentLineLen;
                }

                currentLineLen = 0;

                goto _done;

            case 0x01:
            case 0x02:

                if (currentLineLen > maxLineLen) {
                    maxLineLen = currentLineLen;
                }

                currentLineLen = 0;

                str++;

                break;

            case 0x04:
            case 0x05:
            case 0x06:
            case 0x07:
            case 0x16:
            case 0x17:
            case 0x1C:
            case 0x1D:
                str++;
                break;

            case 0x03:
                currentLineLen += 12;
                str++;
                break;

            case 0x08:
            case 0x09:
            case 0x0A:
            case 0x0B:
            case 0x0C:
            case 0x0D:
            case 0x0E:
            case 0x0F:
                activeFace = *str - 0x08;
                str++;
                break;

            case 0x10:
                while (1) {
                    switch (*str) {
                        case 0x08:
                        case 0x09:
                        case 0x0A:
                        case 0x0B:
                        case 0x0C:
                        case 0x0D:
                        case 0x0E:
                        case 0x0F:
                            activeFace = *str - 0x08;
                            str++;

                            continue;

                        case 0x10:
                            str += 3;

                            continue;
                    }

                    break;
                }

                break;

            case 0x11:
                if (activeFace == speakFace) {
                    if (currentLineLen > maxLineLen) {
                        maxLineLen = currentLineLen;
                    }

                    currentLineLen = 0;

                    goto _done;
                }

                str++;

                break;

            case 0x12:
            case 0x13:
            case 0x14:
                if (!isBubbleOpen) {
                    if (currentLineLen > maxLineLen) {
                        maxLineLen = currentLineLen;
                    }

                    currentLineLen = 0;

                    goto _done;
                }

                str++;

                break;

            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
                currentLineLen += 0x80;
                str++;
                break;

            case 0x80:
                str++;

                switch (*str) {
                    case 0x00:
                    case 0x01:
                    case 0x02:
                    case 0x03:
                    case 0x04:
                    case 0x07:
                    case 0x08:
                    case 0x09:
                    case 0x16:
                    case 0x17:
                    case 0x18:
                    case 0x19:
                    case 0x1A:
                    case 0x1B:
                    case 0x1C:
                    case 0x1D:
                    case 0x1E:
                    case 0x1F:
                    case 0x21:
                    case 0x24:
                    case 0x25:
                        str++;
                        break;

                    case 0x05:
                        NumberToStringAscii(sTalkState->userNumber, buf);
                        currentLineLen += GetStrTalkLen(buf, isBubbleOpen);

                        str++;
                        break;

                    case 0x20:
                        currentLineLen += GetStringTextLen(GetTacticianName());

                        str++;
                        break;

                    case 0x06:
                        currentLineLen += GetStrTalkLen(sTalkState->userString, isBubbleOpen);

                        str++;
                        break;

                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                    case 0x10:
                    case 0x11:
                        activeFace = *str - 0x0A;
                        str++;

                        break;

                    default:
                        break;

                }

                break;

            case 0x81:

                if (str[1] == 0x40) {
                    str += 2;
                    currentLineLen += 6;
                    break;
                }

                /* fallthrough */

            default:
                if ((activeFace != speakFace) && (activeFace != 0xFF)) {
                    if (!isBubbleOpen) {
                        isBubbleOpen = 1;
                        speakFace = activeFace;
                    } else {
                        if (currentLineLen > maxLineLen) {
                            maxLineLen = currentLineLen;
                        }

                        currentLineLen = 0;

                        goto _done;
                    }
                }

                str = GetCharTextLen(str, &chrLen);

                currentLineLen += chrLen;
        }
    }

_done:
    return maxLineLen;
}
