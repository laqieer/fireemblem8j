	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8003D30, "ax", %progbits
@ sub_8003D30 @ JP 0x08003D30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003D30
	.thumb_func
sub_8003D30:
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _08003D68 @ =0x02028E70
	ldr r5, [r3]
	ldrb r4, [r0, #6]
	ldrb r3, [r0, #4]
	muls r3, r4, r3
	ldrh r0, [r0]
	adds r3, r3, r0
	adds r3, r3, r1
	lsls r3, r3, #6
	ldr r1, [r5]
	adds r1, r1, r3
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08003D6C @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl sub_80D636C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003D68: .4byte 0x02028E70
_08003D6C: .4byte 0x001FFFFF

