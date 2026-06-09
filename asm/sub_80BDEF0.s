	.syntax unified
	.set sub_80C2BAC, 0x080C2BAC + 1
	.set sub_80C3144, 0x080C3144 + 1
	.set sub_80C3320, 0x080C3320 + 1
	.set sub_80C333C, 0x080C333C + 1
	.section .text.sub_80BDEF0, "ax", %progbits
@ sub_80BDEF0 @ JP 0x080BDEF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDEF0
	.thumb_func
sub_80BDEF0:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #0
	add r0, sp, #4
	mov r8, r0
	ldr r4, _080BDF34 @ =0x03005270
	ldr r1, _080BDF38 @ =0x081F5D7C
	mov sb, r1
	mov r7, sp
	adds r7, #6
_080BDF0C:
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080BDF7E
	ldrb r1, [r4, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BDF3C
	ldr r0, [r5, #0x54]
	movs r1, #0x12
	ldrsh r2, [r4, r1]
	ldrb r1, [r4, #0x11]
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_80C3320
	b _080BDF50
	.align 2, 0
_080BDF34: .4byte 0x03005270
_080BDF38: .4byte 0x081F5D7C
_080BDF3C:
	ldr r0, [r5, #0x54]
	movs r3, #0x12
	ldrsh r2, [r4, r3]
	ldrb r1, [r4, #0x11]
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_80C333C
_080BDF50:
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #5
	add r0, sb
	ldrh r0, [r0, #0x18]
	mov r1, r8
	strh r0, [r1]
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #5
	add r0, sb
	ldrh r0, [r0, #0x1a]
	strh r0, [r7]
	ldr r0, [r5, #0x54]
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #0
	ldrsh r3, [r7, r1]
	adds r1, r6, #0
	bl sub_80C3144
	ldr r0, [r5, #0x54]
	adds r1, r6, #0
	bl sub_80C2BAC
_080BDF7E:
	adds r4, #4
	adds r6, #1
	cmp r6, #6
	ble _080BDF0C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

