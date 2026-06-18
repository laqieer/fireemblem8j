	.syntax unified
	.set Make6CMOVEUNITForUnitBeingRescued, 0x0801D864 + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801D934, "ax", %progbits
@ Make6CKOIDOAMM @ JP 0x0801D934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Make6CKOIDOAMM
	.thumb_func
Make6CKOIDOAMM:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0801D97C @ =0x085C3220
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r1, #0
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r2, r7, #0
	adds r2, #0x3a
	movs r0, #4
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r6, #0
	bl Make6CMOVEUNITForUnitBeingRescued
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl SetMuMoveScript
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D97C: .4byte 0x085C3220

