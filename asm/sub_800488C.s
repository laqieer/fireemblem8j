	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.GreenText_OnLoop, "ax", %progbits
@ GreenText_OnLoop @ JP 0x0800488C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GreenText_OnLoop
	.thumb_func
GreenText_OnLoop:
	push {lr}
	bl sub_8000CD8
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _080048AC @ =0x020228A8
	lsls r0, r0, #1
	ldr r1, _080048B0 @ =0x085C74E0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_080048AC: .4byte 0x020228A8
_080048B0: .4byte 0x085C74E0

