/* NON_MATCHING: safe project adaptation of decomp.me fork BVOBw by TsilaAllaoui.
 *
 * BVOBw's raw score-zero body compiled to the exact 584 target bytes and passed
 * PROVEN-BOUNDED(3) plus differential EQUIV (44 valid / 16 skipped of 60).
 * It is nevertheless rejected for promotion: the fork declares the real
 * five-argument sub_800A194 as a four-argument function, then relies on a local
 * `subFrame.outgoing` store at [sp] to become the callee's hidden fifth argument.
 * src/sub_800A194.c proves the actual signature. Keeping that mismatched call
 * would be an ABI-dependent semantic compromise.
 *
 * This version uses the real five-argument signature and real DivArm symbol.
 * Under -fno-gcse it is source-quality, exact-size (584 bytes), has the same
 * eight text relocation offsets/types/targets, and is independently
 * PROVEN-BOUNDED(3) plus EQUIV (44 valid / 16 skipped of 60). The only residual
 * is a six-instruction call-setup permutation at +0x13C..+0x147 (12 bytes);
 * local decomp-permuter score 120. Do not promote until that schedule reaches 0
 * without restoring the fake four-argument call. */
#include "global.h"

struct SplineVec2
{
    int x;
    int y;
};

extern void sub_800A194(int *a, int *b, int *c, struct SplineVec2 *d, int n);
extern int DivArm(int num, int den);

/* Compiler allocation barrier only; expands to no machine instructions. */
#define MATCH_BARRIER(...) asm volatile("" : __VA_ARGS__)

void sub_800A34C(int *pts, int *out, u16 *times, unsigned int t, volatile int count)
{
    register int *ptsBase asm("sl");
    register unsigned int ti asm("r3");
    int i;
    register int searchLast asm("r1");
    register int last asm("r8");
    register int lastCopy asm("r6");
    register int k asm("r4");
    register unsigned int u asm("r9");
    int sub[4];
    int coeffA[4];
    int coeffB[4];
    int tan[8];
    int *outLocal;
    u16 *timesLocal;
    unsigned int tLocal;
    int py0;
    int count8;
    int *tx;
    int *ty;
    int *dp;
    register int *txw asm("r5");
    register int *p asm("r3");
    register int *ep0 asm("r5");
    register int *ep1 asm("r4");
    int px0;
    register int px1 asm("r1");
    register int py1 asm("r0");
    register int m0x asm("sl");
    register int m1x asm("r6");
    register int m0y asm("r8");
    register int m1y asm("r1");
    register int ax asm("r2");
    register int bx asm("r4");
    register int ay asm("r6");
    register int by asm("r5");
    register int *pA asm("r7");
    register int *pB asm("r9");
    register int zero asm("r0");
    register int *pBInit asm("r4");
    register int *tyInit asm("r5");
    register int searchIndex asm("r2");
    register u16 *searchTp asm("r0");
    register u16 searchValue asm("r5");
    register int *txInit asm("r2");
    register int initialConstant asm("r2");

    ptsBase = pts;
    *(int * volatile *)&outLocal = out;
    *(u16 * volatile *)&timesLocal = times;
    *(volatile unsigned int *)&tLocal = t;

    ti = t >> 12;
    zero = 0;
    *(volatile int *)&i = zero;
    searchLast = count - 1;

    /* Keep the target's two-instruction SP-relative pointer construction. */
    txInit = (int *)((char *)sub - sizeof(int));
    MATCH_BARRIER("+r"(txInit), "=m"(py0), "=m"(count8));
    txInit += 13;
    *(int * volatile *)&tx = txInit;
    pA = coeffA;
    pBInit = coeffB;
    pB = pBInit;
    tyInit = (int *)((char *)sub - sizeof(int));
    MATCH_BARRIER("+r"(tyInit), "+r"(pBInit));
    tyInit += 14;
    *(int * volatile *)&ty = tyInit;

    if (zero < searchLast)
    {
        register unsigned int firstTime asm("r0");
        register unsigned int secondTime asm("r1");

        lastCopy = searchLast;
        /* The target reloads the table base into the same result register. */
        firstTime = timesLocal[0];
        if (ti < firstTime)
            goto search_times;

        {
            register u16 *secondBase asm("r1");

            secondBase = *(u16 * volatile *)&timesLocal;
            secondTime = secondBase[1];
        }
        if (ti < secondTime)
            goto search_done;

search_times:
        do
        {
            /* Force agbcc's stack-resident index update used by the target. */
            searchIndex = *(volatile int *)&i;
            searchIndex++;
            *(volatile int *)&i = searchIndex;
            if (searchIndex >= lastCopy)
                break;

            /* Preserve the target's r0/r4/r5 indexed lookup allocation. */
            {
                register int searchOffset asm("r0");
                register u16 *searchBase asm("r4");
                searchOffset = searchIndex << 1;
                searchBase = *(u16 * volatile *)&timesLocal;
                searchTp = (u16 *)((char *)searchOffset + (int)searchBase);
                searchValue = searchTp[0];
            }
        }
        while ((ti < searchValue) || (ti >= searchTp[1]));
    }
search_done:

    coeffA[0] = 0x2000;
    initialConstant = 0x1000;
    coeffB[0] = initialConstant;
    {
        register int *xBase asm("r0");
        register int x0 asm("r1");
        register int x2 asm("r0");
        xBase = ptsBase;
        x0 = xBase[0];
        x2 = xBase[2];
        x0 -= x2;
        x2 = -3 * x0;
        tan[0] = x2;
    }
    {
        register int *yBase asm("r3");
        register int y0 asm("r1");
        register int y1 asm("r0");
        register int *txStore asm("r4");
        yBase = ptsBase;
        y0 = yBase[1];
        y1 = yBase[3];
        y0 -= y1;
        y1 = -3 * y0;
        txStore = tx;
        txStore[1] = y1;
        p = yBase;
    }

    k = 1;
    {
        register int loopCount asm("r5");
        loopCount = count;
        loopCount--;
        last = loopCount;
    }
    lastCopy = last;
    {
        register int byteCount asm("r0");
        byteCount = count;
        byteCount <<= 3;
        *(volatile int *)&count8 = byteCount;
    }

    if (k < lastCopy)
    {
        register int constant asm("ip");
        register int offset4 asm("r1");
        register int offset8 asm("r2");
        register int dpValue asm("r2");
        register int *aDst asm("r2");
        register int *bDst asm("r1");
        register int *tyBase asm("r0");
        register int *yDst asm("r2");
        register int *dpInit asm("r1");

        constant = initialConstant;
        txw = tx + 2;
        /* Exact SP-relative initialization of the advancing sub-array cursor. */
        dpInit = (int *)((char *)sub - sizeof(int));
        MATCH_BARRIER("+r"(dpInit), "=m"(dp));
        dpInit += 2;
        dp = dpInit;
        do
        {
            offset4 = k << 2;
            /* agbcc schedules the constant move before the stack reload;
             * keep this four-instruction cursor store in target order. */
            *dp++ = constant;

            aDst = (int *)((char *)pA + offset4);
            *aDst = 0x4000;

            bDst = (int *)((char *)pB + offset4);
            dpValue = constant;
            *(volatile int *)bDst = dpValue;

            offset8 = k << 3;
            *txw = -3 * (p[0] - p[4]);

            tyBase = *(int * volatile *)&ty;
            yDst = (int *)((char *)tyBase + offset8);
            *yDst = -3 * (p[1] - p[5]);

            p += 2;
            txw += 2;
            k++;
        }
        while (k < last);
    }

    {
        register int offset4 asm("r1");
        register int offset8 asm("r2");
        register int tailConstant asm("r2");
        register int coeffValue asm("r0");
        register int *subDst asm("r0");
        register int *coeffDst asm("r1");
        register int *txBaseTail asm("r4");
        register int *txDst asm("r3");
        register int *endBase asm("r0");
        register int *tyBaseTail asm("r0");
        register int *tyDst asm("r2");

        offset4 = lastCopy << 2;
        /* Keep the target's three-instruction SP-relative endpoint address. */
        subDst = (int *)((char *)sub - sizeof(int));
        MATCH_BARRIER("+r"(subDst));
        subDst = (int *)((char *)subDst + offset4);
        subDst++;
        tailConstant = 0x1000;
        *(volatile int *)subDst = tailConstant;

        coeffDst = (int *)((char *)pA + offset4);
        coeffValue = 0x2000;
        *coeffDst = coeffValue;

        offset8 = lastCopy << 3;
        txBaseTail = tx;
        txDst = (int *)((char *)txBaseTail + offset8);

        endBase = (int *)((char *)ptsBase + count8);
        ep0 = endBase - 4;
        ep1 = endBase - 2;
        *txDst = -3 * (ep0[0] - ep1[0]);

        tyBaseTail = ty;
        tyDst = (int *)((char *)tyBaseTail + offset8);
        *tyDst = -3 * (ep0[1] - ep1[1]);
    }

    {
        register int *callA asm("r0");
        int *callB;
        int *callSub;
        struct SplineVec2 *callTx;

        callA = pA;
        callB = pB;
        callSub = sub;
        callTx = (struct SplineVec2 *)tx;
        sub_800A194(callA, callB, callSub, callTx, count);
    }

    {
        register int segment asm("r2");
        segment = i;
        /* agbcc emits an inverted branch plus a redundant jump here.
         * Preserve the target's direct signed fallback edge. */
        if (segment >= lastCopy)
            goto fallback;
        {
            {
                register int timeOffset asm("r1");
                register u16 *timeBase asm("r3");
                register u16 *timePtr asm("r1");
                register unsigned int time0 asm("r2");
                register unsigned int shiftedTime asm("r0");
                register unsigned int fullTime asm("r4");
                register unsigned int time1 asm("r1");

                timeOffset = segment << 1;
                timeBase = timesLocal;
                timePtr = (u16 *)timeOffset;
                timePtr = (u16 *)((char *)timePtr + (int)timeBase);
                time0 = timePtr[0];
                shiftedTime = time0 << 12;
                fullTime = tLocal;
                shiftedTime = fullTime - shiftedTime;
                time1 = timePtr[1];
                time1 -= time0;
                u = shiftedTime / time1;
            }
            {
                register int pointIndex asm("r5");
                register int pointOffset asm("r8");
                register int *pointBase asm("r5");
                register int *txCurrent asm("r0");
                register int nextOffset asm("r3");
                register int *txNextBase asm("r4");
                register int *txNext asm("r0");
                register int *tyBaseInterp asm("r5");
                register int *tyCurrent asm("r8");
                register int tempM0y asm("r1");
                register int *tyNext asm("r3");
                register int py0ForAy asm("r1");
                register int py0ForBy asm("r3");

                pointIndex = i;
                pointIndex <<= 3;
                pointOffset = pointIndex;
                pointBase = (int *)((char *)ptsBase + pointIndex);

                px0 = pointBase[0];
                px1 = pointBase[2];
                ax = 2 * (px0 - px1);

                txCurrent = tx;
                txCurrent = (int *)((char *)txCurrent + pointOffset);
                m0x = txCurrent[0];
                ax += m0x;

                nextOffset = i;
                nextOffset++;
                nextOffset <<= 3;
                txNextBase = tx;
                txNext = (int *)((char *)txNextBase + nextOffset);
                m1x = txNext[0];
                ax += m1x;
                bx = 3 * (px1 - px0) - 2 * m0x - m1x;

                *(volatile int *)&py0 = pointBase[1];
                py1 = pointBase[3];
                py0ForAy = py0;
                ay = py0ForAy - py1;
                ay <<= 1;

                tyBaseInterp = ty;
                tyCurrent = (int *)((char *)tyBaseInterp + pointOffset);
                MATCH_BARRIER("+r"(ay));
                tempM0y = tyCurrent[0];
                m0y = tempM0y;
                ay += m0y;

                tyNext = (int *)((char *)tyBaseInterp + nextOffset);
                m1y = tyNext[0];
                ay += m1y;
                py0ForBy = py0;
                by = 3 * (py1 - py0ForBy) - 2 * m0y - m1y;
            }

            {
                register int callScale asm("r0");
                register int callValue asm("r1");
                register int eval asm("r0");
                register int *outBase asm("r4");
                register int finalYBase asm("r5");

                callValue = u * ax;
                callScale = 0x1000;
                eval = DivArm(callScale, callValue);
                eval += bx;

                callValue = u * eval;
                callScale = 0x1000;
                eval = DivArm(callScale, callValue);
                eval += m0x;

                callValue = u * eval;
                callScale = 0x1000;
                eval = DivArm(callScale, callValue);
                eval += px0;
                outBase = outLocal;
                outBase[0] = eval;

                callValue = u * ay;
                callScale = 0x1000;
                eval = DivArm(callScale, callValue);
                eval += by;

                callValue = u * eval;
                callScale = 0x1000;
                eval = DivArm(callScale, callValue);
                eval += m0y;

                callValue = u * eval;
                callScale = 0x1000;
                eval = DivArm(callScale, callValue);
                finalYBase = py0;
                eval += finalYBase;
                outBase[1] = eval;
            }
        }
        goto done;

fallback:
        {
            register int copyValue asm("r0");
            register int *copyOut asm("r1");

            copyValue = ep1[0];
            copyOut = outLocal;
            copyOut[0] = copyValue;
            copyValue = ep1[1];
            copyOut[1] = copyValue;
        }

done:
    }

}
