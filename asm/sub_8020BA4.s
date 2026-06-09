	.syntax unified
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8020BA4, "ax", %progbits
@ sub_8020BA4 @ JP 0x08020BA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020BA4
	.thumb_func
sub_8020BA4:
	push {r4, lr}
	adds r4, r0, #0
	bl j_ColorFadeTick
	bl sub_8001EE4
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020BEC
	ldr r2, _08020BF4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBackgroundTileDataOffset
	adds r0, r4, #0
	bl sub_8002DE4
_08020BEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020BF4: .4byte 0x03003020

