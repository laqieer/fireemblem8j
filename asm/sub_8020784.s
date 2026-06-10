	.syntax unified
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8020784, "ax", %progbits
@ sub_8020784 @ JP 0x08020784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020784
	.thumb_func
sub_8020784:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8000CD8
	adds r4, r0, #0
	movs r0, #3
	ands r4, r0
	cmp r4, #0
	bne _080207E0
	bl j_ColorFadeTick
	bl sub_8001EE4
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080207E0
	ldr r2, _080207E8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBackgroundTileDataOffset
	ldr r0, _080207EC @ =0x020228A8
	strh r4, [r0]
	bl sub_8001EE4
	adds r0, r5, #0
	bl sub_8002DE4
_080207E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080207E8: .4byte 0x03003020
_080207EC: .4byte 0x020228A8

