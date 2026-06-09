	.syntax unified
	.set GmTmConfront_LoadPositions, 0x080C5330 + 1
	.section .text.GmTmConfront_InitUnitPositionA, "ax", %progbits
@ GmTmConfront_InitUnitPositionA @ JP 0x080C5390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmTmConfront_InitUnitPositionA
	.thumb_func
GmTmConfront_InitUnitPositionA:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C53A4 @ =0x081F65C0
	bl GmTmConfront_LoadPositions
	movs r0, #0x10
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C53A4: .4byte 0x081F65C0

