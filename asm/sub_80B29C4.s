	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80D6368, 0x080D6368 + 1
	.section .text.sub_80B29C4, "ax", %progbits
@ sub_80B29C4 @ JP 0x080B29C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B29C4
	.thumb_func
sub_80B29C4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r1
	adds r1, r2, #0
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080B29E2
	adds r2, r0, #0
_080B29E2:
	cmp r6, r0
	bgt _080B29E8
	adds r6, r0, #0
_080B29E8:
	str r1, [sp]
	str r3, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	movs r4, #0x80
	lsls r4, r4, #0x11
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
	mov r2, r8
	asrs r0, r2, #4
	strh r0, [r1, #0x10]
	ldr r1, _080B2A34 @ =0x03003078
	cmp r7, #2
	bne _080B2A20
	subs r1, #0x10
_080B2A20:
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
_080B2A34: .4byte 0x03003078

