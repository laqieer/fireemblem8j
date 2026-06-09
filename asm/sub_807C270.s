	.syntax unified
	.set HideMu, 0x0807BBE8 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807C8DC, 0x0807C8DC + 1
	.section .text.sub_807C270, "ax", %progbits
@ sub_807C270 @ JP 0x0807C270 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C270
	.thumb_func
sub_807C270:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r5, [sp, #0x28]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	str r0, [sp, #4]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	mov sl, r0
	lsls r0, r4, #3
	adds r0, r0, r6
	subs r0, #8
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	lsls r0, r0, #0x10
	lsrs r1, r1, #0x1a
	orrs r1, r0
	str r1, [sp]
	mov sb, sp
	adds r0, r7, #0
	mov r1, sp
	adds r2, r5, #0
	bl sub_807C8DC
	mov r0, r8
	str r7, [r0, #0x2c]
	adds r0, r7, #0
	bl sub_807A888
	mov r1, r8
	str r0, [r1, #0x30]
	str r6, [r1, #0x34]
	movs r0, #0
	strh r4, [r1, #0x38]
	strh r0, [r1, #0x3a]
	ldrh r0, [r6, #6]
	strh r0, [r1, #0x3c]
	strh r5, [r1, #0x3e]
	mov r0, sp
	ldrh r1, [r0]
	mov r0, r8
	adds r0, #0x40
	strb r1, [r0]
	mov r2, sb
	ldrh r0, [r2, #2]
	mov r1, r8
	adds r1, #0x41
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x42
	mov r3, sp
	ldrb r3, [r3, #4]
	strb r3, [r0]
	adds r0, #1
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80280A0
	ldr r0, [r7, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r7, #0xc]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0807C374 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	ldrb r2, [r7, #0xb]
	cmp r0, r2
	bne _0807C32C
	movs r3, #0
	strb r3, [r1]
_0807C32C:
	ldr r2, _0807C378 @ =0x0202E4EC
	ldr r1, [r2]
	mov r3, sl
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	movs r3, #0
	strb r3, [r0]
	mov r1, sb
	movs r3, #2
	ldrsh r0, [r1, r3]
	ldr r1, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r1, [r7]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl HideMu
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C374: .4byte 0x0202E4D4
_0807C378: .4byte 0x0202E4EC

