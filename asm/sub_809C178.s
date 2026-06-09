	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetFaceDisplayBitsById, 0x08005694 + 1
	.set SetFacePosition, 0x0800651C + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.section .text.sub_809C178, "ax", %progbits
@ sub_809C178 @ JP 0x0809C178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C178
	.thumb_func
sub_809C178:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0809C1D4 @ =0x08A946E8
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x44
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _0809C1D8
	cmp r0, #0
	beq _0809C1B6
	adds r0, r4, #0
	bl EndFaceById
_0809C1B6:
	cmp r6, #0
	beq _0809C1EE
	adds r0, r6, #0
	bl sub_8018FCC
	adds r1, r0, #0
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r7, #0
	mov r3, r8
	bl sub_80063F8
	b _0809C1EE
	.align 2, 0
_0809C1D4: .4byte 0x08A946E8
_0809C1D8:
	cmp r6, #0
	beq _0809C1EE
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl SetFacePosition
	adds r0, r4, #0
	mov r1, sb
	bl SetFaceDisplayBitsById
_0809C1EE:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

