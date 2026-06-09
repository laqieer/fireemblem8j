	.syntax unified
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.set sub_80C996C, 0x080C996C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C9C7C, "ax", %progbits
@ sub_80C9C7C @ JP 0x080C9C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9C7C
	.thumb_func
sub_80C9C7C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C9CB8
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl _DivArm1
	movs r3, #0x80
	lsls r3, r3, #5
	subs r3, r3, r0
	ldr r0, _080C9CB0 @ =0x08B3B72C
	ldr r1, _080C9CB4 @ =0x02022908
	movs r2, #0x10
	bl sub_80C996C
	b _080C9CF8
	.align 2, 0
_080C9CB0: .4byte 0x08B3B72C
_080C9CB4: .4byte 0x02022908
_080C9CB8:
	str r5, [sp]
	ldr r1, _080C9D0C @ =0x02022908
	ldr r2, _080C9D10 @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	strh r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x5a
	strh r0, [r4, #0x2a]
	ldr r2, _080C9D14 @ =0x03003020
	ldrb r1, [r2, #1]
	subs r0, #0x5c
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl sub_8002DE4
_080C9CF8:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_80C96D0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D0C: .4byte 0x02022908
_080C9D10: .4byte 0x01000008
_080C9D14: .4byte 0x03003020

