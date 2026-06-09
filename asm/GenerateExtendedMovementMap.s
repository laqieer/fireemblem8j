	.syntax unified
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.section .text.GenerateExtendedMovementMap, "ax", %progbits
@ GenerateExtendedMovementMap @ JP 0x0801A138 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenerateExtendedMovementMap
	.thumb_func
GenerateExtendedMovementMap:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl SetWorkingMoveCosts
	ldr r0, _0801A160 @ =0x0202E4DC
	ldr r1, [r0]
	ldr r0, _0801A164 @ =0x03004940
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl sub_801A1B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A160: .4byte 0x0202E4DC
_0801A164: .4byte 0x03004940

