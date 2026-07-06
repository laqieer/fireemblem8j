/* Live-state capture harness for equivalence research (Discussion #149).
 *
 * Some src/nonmatching/*.c functions (notably sub_8057F80 =
 * PrepareBattleGraphicsMaybe) read dozens of live battle-animation globals and
 * FAULT on synthetic/black-box input — they can only be exercised from a real,
 * self-consistent game state.  This boots fireemblem8.gba in mGBA (full-system
 * emulator, libmgba), fast-forwards into a real battle by mashing A (FE8's
 * opening prologue plays scripted combat within ~12k frames), then SINGLE-STEPS
 * to catch the EXACT instant a target ROM function is entered and dumps the
 * caller-visible state: all 16 ARM registers (the real ABI args!) + EWRAM +
 * IWRAM.  differential_test.py / replay_diff.py then replay the JP ROM bytes vs
 * the compiled reconstruction from that captured state under Unicorn.
 *
 * Build:  gcc capture.c -o capture -I/usr/include -lmgba   (needs libmgba-dev)
 * Usage:  ./capture <rom.gba> <target_hex_addr> [fast_frames] [max_steps]
 *   e.g.  ./capture fireemblem8.gba 08057f80 12100 60000000
 * Output: /tmp/mgbah/{regs.txt,ewram.bin,iwram.bin} + a CAPTURED/NO_HIT line.
 *
 * Determinism: A-mash reaches the same battle every run, so the captured state
 * is reproducible from the committed ROM without shipping a binary snapshot.
 */
#include <mgba/core/core.h>
#include <mgba/core/config.h>
#include <mgba/core/log.h>
#include <mgba/internal/arm/arm.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define K_A (1 << 0)

static struct mCore* core;
static void nullLog(struct mLogger* l, int c, enum mLogLevel v, const char* f, va_list a) {}
static struct mLogger g_log = { .log = nullLog };

static void dump(struct ARMCore* cpu, uint32_t target, long step) {
    FILE* fr = fopen("/tmp/mgbah/regs.txt", "w");
    for (int i = 0; i < 16; i++) fprintf(fr, "%08x\n", cpu->gprs[i]);
    fclose(fr);
    FILE* fe = fopen("/tmp/mgbah/ewram.bin", "wb");
    for (uint32_t a = 0x02000000; a < 0x02040000; a += 4) {
        uint32_t v = core->busRead32(core, a); fwrite(&v, 4, 1, fe);
    }
    fclose(fe);
    FILE* fi = fopen("/tmp/mgbah/iwram.bin", "wb");
    for (uint32_t a = 0x03000000; a < 0x03008000; a += 4) {
        uint32_t v = core->busRead32(core, a); fwrite(&v, 4, 1, fi);
    }
    fclose(fi);
    printf("CAPTURED target=%08x r0=%08x r1=%08x r2=%08x r3=%08x step=%ld\n",
           target, cpu->gprs[0], cpu->gprs[1], cpu->gprs[2], cpu->gprs[3], step);
}

int main(int argc, char** argv) {
    mLogSetDefaultLogger(&g_log);
    if (argc < 3) { fprintf(stderr, "usage: %s rom target_hex [fast_frames] [max_steps]\n", argv[0]); return 2; }
    const char* rom = argv[1];
    uint32_t target = strtoul(argv[2], 0, 16);
    int fast_to = argc > 3 ? atoi(argv[3]) : 12100;
    long maxstep = argc > 4 ? atol(argv[4]) : 60000000L;

    system("mkdir -p /tmp/mgbah");
    core = mCoreFind(rom);
    if (!core) { fprintf(stderr, "mCoreFind failed\n"); return 2; }
    core->init(core);
    mCoreConfigInit(&core->config, "cap");
    unsigned w, h; core->desiredVideoDimensions(core, &w, &h);
    color_t* vb = malloc((size_t)w * h * sizeof(color_t));
    core->setVideoBuffer(core, vb, w);
    core->setAudioBufferSize(core, 1024);
    mCoreLoadFile(core, rom);
    core->reset(core);
    struct ARMCore* cpu = core->cpu;

    /* phase 1: fast-forward with A-mash to just before the known battle */
    for (int f = 0; f < fast_to; f++) {
        core->setKeys(core, (f % 8 < 3) ? K_A : 0);
        core->runFrame(core);
    }
    fprintf(stderr, "fast done at frame %d; single-stepping for target %08x...\n", fast_to, target);

    /* phase 2: single-step; detect function ENTRY (thumb exec addr = (pc&~1)-4) */
    uint32_t prev = 0;
    for (long s = 0; s < maxstep; s++) {
        if ((s % 20000) == 0) core->setKeys(core, ((s / 20000) % 8 < 3) ? K_A : 0);
        core->step(core);
        uint32_t exec = (cpu->gprs[15] & ~1) - 4;
        if (exec == target && prev != target) {
            fprintf(stderr, "HIT target=%08x r0=%08x r1=%08x SP=%08x LR=%08x (step=%ld)\n",
                    target, cpu->gprs[0], cpu->gprs[1], cpu->gprs[13], cpu->gprs[14], s);
            dump(cpu, target, s);
            return 0;
        }
        prev = exec;
    }
    printf("NO_HIT target=%08x after %ld steps\n", target, maxstep);
    return 1;
}
