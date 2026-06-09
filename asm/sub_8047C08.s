	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_804D57C, 0x0804D57C + 1
	.section .text.sub_8047C08, "ax", %progbits
@ sub_8047C08 @ JP 0x08047C08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047C08
	.thumb_func
sub_8047C08:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, _08047C9C @ =0x080DEEB0
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov sb, r0
_08047C30:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl sub_8012E84
	adds r4, r0, #0
	mov r0, sb
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl sub_8012E84
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_804D57C
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge _08047C30
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble _08047C84
	adds r0, r5, #0
	bl sub_8002DE4
_08047C84:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C9C: .4byte 0x080DEEB0

