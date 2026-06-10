	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_8047970, 0x08047970 + 1
	.set sub_804D57C, 0x0804D57C + 1
	.section .text.sub_8047B78, "ax", %progbits
@ sub_8047B78 @ JP 0x08047B78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047B78
	.thumb_func
sub_8047B78:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	rsbs r1, r1, #0
	ldr r5, _08047C04 @ =0x080DEEB0
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl sub_8012E84
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl sub_8012E84
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
_08047BB2:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl sub_804D57C
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08047BB2
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble _08047BF2
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl sub_8047970
	movs r1, #0
	bl sub_8043084
	adds r0, r7, #0
	movs r1, #1
	bl sub_8047970
	movs r1, #1
	bl sub_8043084
	adds r0, r7, #0
	bl sub_8002DE4
_08047BF2:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C04: .4byte 0x080DEEB0

