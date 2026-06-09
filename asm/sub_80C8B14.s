	.syntax unified
	.set PutWmMinimapSprites, 0x080C881C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C899C, 0x080C899C + 1
	.section .text.sub_80C8B14, "ax", %progbits
@ sub_80C8B14 @ JP 0x080C8B14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8B14
	.thumb_func
sub_80C8B14:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C8B50 @ =0x08AC2834
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80C899C
	adds r0, r4, #0
	bl PutWmMinimapSprites
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bne _080C8B48
	movs r0, #0
	str r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080C8B48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8B50: .4byte 0x08AC2834

