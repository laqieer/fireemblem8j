	.syntax unified
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.set sub_80C996C, 0x080C996C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CA144, "ax", %progbits
@ sub_80CA144 @ JP 0x080CA144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA144
	.thumb_func
sub_80CA144:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	bgt _080CA184
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x3c
	movs r2, #0
	bl _DivArm1
	movs r3, #0x80
	lsls r3, r3, #5
	subs r3, r3, r0
	ldr r0, _080CA17C @ =0x0201CDD4
	ldr r1, _080CA180 @ =0x020228A8
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_80C996C
	b _080CA19C
	.align 2, 0
_080CA17C: .4byte 0x0201CDD4
_080CA180: .4byte 0x020228A8
_080CA184:
	str r5, [sp]
	ldr r1, _080CA1B0 @ =0x020228A8
	ldr r2, _080CA1B4 @ =0x01000080
	mov r0, sp
	bl sub_80D636C
	strh r5, [r4, #0x2c]
	movs r0, #0x3c
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
_080CA19C:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_80C96D0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA1B0: .4byte 0x020228A8
_080CA1B4: .4byte 0x01000080

