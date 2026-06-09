	.syntax unified
	.set GmTmConfront_LoadPositions, 0x080C5330 + 1
	.section .text.GmTmConfront_InitUnitPositionC, "ax", %progbits
@ GmTmConfront_InitUnitPositionC @ JP 0x080C53DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmTmConfront_InitUnitPositionC
	.thumb_func
GmTmConfront_InitUnitPositionC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C53F0 @ =0x081F65D0
	bl GmTmConfront_LoadPositions
	movs r0, #5
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C53F0: .4byte 0x081F65D0

