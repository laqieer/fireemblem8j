	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8003CF8, "ax", %progbits
@ sub_8003CF8 @ JP 0x08003CF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003CF8
	.thumb_func
sub_8003CF8:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	str r0, [sp]
	ldr r0, _08003D2C @ =0x02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	bl sub_80D65C0
	adds r1, r0, #0
	ldrb r2, [r4, #4]
	lsls r2, r2, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl sub_80D636C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003D2C: .4byte 0x02028E70

