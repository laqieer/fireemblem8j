	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80D6368, 0x080D6368 + 1
	.section .text.sub_80B289C, "ax", %progbits
@ BgAffinRotScaling @ JP 0x080B289C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BgAffinRotScaling
	.thumb_func
BgAffinRotScaling:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	lsls r5, r5, #0x10
	asrs r6, r5, #0x10
	cmp r2, #4
	bgt _080B28C8
	movs r2, #4
_080B28C8:
	cmp r6, #4
	bgt _080B28CE
	movs r6, #4
_080B28CE:
	lsls r0, r0, #8
	str r0, [sp]
	lsls r0, r3, #8
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r4, #0
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	lsls r0, r7, #4
	strh r0, [r1, #0x10]
	ldr r1, _080B2920 @ =0x03003078
	mov r0, r8
	cmp r0, #2
	bne _080B290A
	subs r1, #0x10
_080B290A:
	mov r0, sp
	movs r2, #1
	bl sub_80D6368
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2920: .4byte 0x03003078

