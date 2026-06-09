	.syntax unified
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.set sub_80C996C, 0x080C996C + 1
	.section .text.sub_80C9EBC, "ax", %progbits
@ sub_80C9EBC @ JP 0x080C9EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9EBC
	.thumb_func
sub_80C9EBC:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080C9EE4
	ldr r2, _080C9F0C @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_080C9EE4:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2d
	bgt _080C9F18
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2e
	movs r2, #0
	bl _DivArm1
	adds r3, r0, #0
	ldr r0, _080C9F10 @ =0x08BB05BC
	ldr r1, _080C9F14 @ =0x02022A88
	movs r2, #0x10
	bl sub_80C996C
	b _080C9F46
	.align 2, 0
_080C9F0C: .4byte 0x03003020
_080C9F10: .4byte 0x08BB05BC
_080C9F14: .4byte 0x02022A88
_080C9F18:
	ldr r0, _080C9F58 @ =0x08BB05BC
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r2, _080C9F5C @ =0x081F6C94
	adds r0, r4, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r4, #0x2a]
	movs r0, #0
	strh r0, [r4, #0x2c]
_080C9F46:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_80C96D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F58: .4byte 0x08BB05BC
_080C9F5C: .4byte 0x081F6C94

