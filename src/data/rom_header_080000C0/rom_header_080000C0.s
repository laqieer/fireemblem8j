/* JP boot crt0 (ROM 0x080000C0) -- identified as fe8u src/crt0.s: the ARM entry
 * stub (IRQ/System stack setup, IRQ vector install, jump to AgbMain) + IrqMain
 * interrupt dispatcher. Carved from the raw INCBIN blob to a descriptive,
 * annotated .4byte listing (byte-exact; kept in its original .data.residue
 * section since it is spliced at the fixed ROM entry). Literal-pool JP values:
 * __sp_usr=0x03007E00 __sp_irq=0x03007FA0 INTR_VECTOR=0x03007FFC
 * AgbMain=0x08000A20 gIRQHandlers=0x03003090.
 */
	.section .data.residue.080000C0, "aw", %progbits
	.global rom_header_080000C0
	.type rom_header_080000C0, %object
rom_header_080000C0:
	.4byte 0xE3A00012	@ +0x00  mov r0, #18
	.4byte 0xE129F000	@ +0x04  msr CPSR_fc, r0
	.4byte 0xE59FD028	@ +0x08  ldr sp, [pc, #40]
	.4byte 0xE3A0001F	@ +0x0C  mov r0, #31
	.4byte 0xE129F000	@ +0x10  msr CPSR_fc, r0
	.4byte 0xE59FD018	@ +0x14  ldr sp, [pc, #24]
	.4byte 0xE59F113C	@ +0x18  ldr r1, [pc, #316]
	.4byte 0xE28F0018	@ +0x1C  add r0, pc, #24
	.4byte 0xE5810000	@ +0x20  str r0, [r1]
	.4byte 0xE59F1134	@ +0x24  ldr r1, [pc, #308]
	.4byte 0xE1A0E00F	@ +0x28  mov lr, pc
	.4byte 0xE12FFF11	@ +0x2C  bx r1
	.4byte 0xEAFFFFF2	@ +0x30  b 0x80000c0
	.4byte 0x03007E00	@ +0x34  .word __sp_usr (0x03007E00)
	.4byte 0x03007FA0	@ +0x38  .word __sp_irq (0x03007FA0)
	.4byte 0xE3A03301	@ +0x3C  mov r3, #67108864
	.4byte 0xE2833C02	@ +0x40  add r3, r3, #512
	.4byte 0xE5932000	@ +0x44  ldr r2, [r3]
	.4byte 0xE1A01802	@ +0x48  lsl r1, r2, #16
	.4byte 0xE1A01821	@ +0x4C  lsr r1, r1, #16
	.4byte 0xE14F0000	@ +0x50  mrs r0, SPSR
	.4byte 0xE92D400B	@ +0x54  push {r0, r1, r3, lr}
	.4byte 0xE0021822	@ +0x58  and r1, r2, r2, lsr #16
	.4byte 0xE2110A02	@ +0x5C  ands r0, r1, #8192
	.4byte 0x1AFFFFFE	@ +0x60  bne 0x8000120
	.4byte 0xE3A02000	@ +0x64  mov r2, #0
	.4byte 0xE2110001	@ +0x68  ands r0, r1, #1
	.4byte 0x1A000026	@ +0x6C  bne 0x80001cc
	.4byte 0xE2822004	@ +0x70  add r2, r2, #4
	.4byte 0xE2110002	@ +0x74  ands r0, r1, #2
	.4byte 0x1A000023	@ +0x78  bne 0x80001cc
	.4byte 0xE2822004	@ +0x7C  add r2, r2, #4
	.4byte 0xE2110004	@ +0x80  ands r0, r1, #4
	.4byte 0x1A000020	@ +0x84  bne 0x80001cc
	.4byte 0xE2822004	@ +0x88  add r2, r2, #4
	.4byte 0xE2110008	@ +0x8C  ands r0, r1, #8
	.4byte 0x1A00001D	@ +0x90  bne 0x80001cc
	.4byte 0xE2822004	@ +0x94  add r2, r2, #4
	.4byte 0xE2110010	@ +0x98  ands r0, r1, #16
	.4byte 0x1A00001A	@ +0x9C  bne 0x80001cc
	.4byte 0xE2822004	@ +0xA0  add r2, r2, #4
	.4byte 0xE2110020	@ +0xA4  ands r0, r1, #32
	.4byte 0x1A000017	@ +0xA8  bne 0x80001cc
	.4byte 0xE2822004	@ +0xAC  add r2, r2, #4
	.4byte 0xE2110040	@ +0xB0  ands r0, r1, #64
	.4byte 0x1A000014	@ +0xB4  bne 0x80001cc
	.4byte 0xE2822004	@ +0xB8  add r2, r2, #4
	.4byte 0xE2110080	@ +0xBC  ands r0, r1, #128
	.4byte 0x1A000011	@ +0xC0  bne 0x80001cc
	.4byte 0xE2822004	@ +0xC4  add r2, r2, #4
	.4byte 0xE2110C01	@ +0xC8  ands r0, r1, #256
	.4byte 0x1A00000E	@ +0xCC  bne 0x80001cc
	.4byte 0xE2822004	@ +0xD0  add r2, r2, #4
	.4byte 0xE2110C02	@ +0xD4  ands r0, r1, #512
	.4byte 0x1A00000B	@ +0xD8  bne 0x80001cc
	.4byte 0xE2822004	@ +0xDC  add r2, r2, #4
	.4byte 0xE2110B01	@ +0xE0  ands r0, r1, #1024
	.4byte 0x1A000008	@ +0xE4  bne 0x80001cc
	.4byte 0xE2822004	@ +0xE8  add r2, r2, #4
	.4byte 0xE2110B02	@ +0xEC  ands r0, r1, #2048
	.4byte 0x1A000005	@ +0xF0  bne 0x80001cc
	.4byte 0xE2822004	@ +0xF4  add r2, r2, #4
	.4byte 0xE2110A01	@ +0xF8  ands r0, r1, #4096
	.4byte 0x1A000002	@ +0xFC  bne 0x80001cc
	.4byte 0xE2822004	@ +0x100  add r2, r2, #4
	.4byte 0xE2110A02	@ +0x104  ands r0, r1, #8192
	.4byte 0x1AFFFFFE	@ +0x108  bne 0x80001c8
	.4byte 0xE1C300B2	@ +0x10C  strh r0, [r3, #2]
	.4byte 0xE10F3000	@ +0x110  mrs r3, CPSR
	.4byte 0xE3C330DF	@ +0x114  bic r3, r3, #223
	.4byte 0xE383301F	@ +0x118  orr r3, r3, #31
	.4byte 0xE129F003	@ +0x11C  msr CPSR_fc, r3
	.4byte 0xE59F103C	@ +0x120  ldr r1, [pc, #60]
	.4byte 0xE0811002	@ +0x124  add r1, r1, r2
	.4byte 0xE5910000	@ +0x128  ldr r0, [r1]
	.4byte 0xE92D4000	@ +0x12C  stmfd sp!, {lr}
	.4byte 0xE28FE000	@ +0x130  add lr, pc, #0
	.4byte 0xE12FFF10	@ +0x134  bx r0
	.4byte 0xE8BD4000	@ +0x138  ldmfd sp!, {lr}
	.4byte 0xE10F3000	@ +0x13C  mrs r3, CPSR
	.4byte 0xE3C330DF	@ +0x140  bic r3, r3, #223
	.4byte 0xE3833092	@ +0x144  orr r3, r3, #146
	.4byte 0xE129F003	@ +0x148  msr CPSR_fc, r3
	.4byte 0xE8BD400B	@ +0x14C  pop {r0, r1, r3, lr}
	.4byte 0xE1C310B0	@ +0x150  strh r1, [r3]
	.4byte 0xE169F000	@ +0x154  msr SPSR_fc, r0
	.4byte 0xE12FFF1E	@ +0x158  bx lr
	.4byte 0x03007FFC	@ +0x15C  .word INTR_VECTOR (0x03007FFC)
	.4byte 0x08000A21	@ +0x160  .word AgbMain (0x08000A20 thumb)
	.4byte 0x03003090	@ +0x164  .word gIRQHandlers (0x03003090)
	.size rom_header_080000C0, 360
