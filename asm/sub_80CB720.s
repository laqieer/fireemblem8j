	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set ClearFirstPalDirectly, 0x080CB70C + 1
	.set CopyFirstPalDirectly, 0x080CB6C8 + 1
	.set SetFirstPalDirectly, 0x080CB6E0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80CB720, "ax", %progbits
@ sub_80CB720 @ JP 0x080CB720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB720
	.thumb_func
sub_80CB720:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, [sp, #0x28]
	mov r8, r2
	ldr r2, [sp, #0x2c]
	lsls r6, r0, #0x10
	asrs r7, r6, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sb, r2
	mov r0, sl
	bl sub_8001BC0
	adds r5, r0, #0
	cmp r4, #0
	bne _080CB754
	subs r4, #8
_080CB754:
	asrs r0, r4, #3
	adds r4, r0, #1
	asrs r0, r6, #0x13
	adds r0, #1
	adds r7, #0x10
	str r7, [sp]
	cmp r4, r0
	bge _080CB7B8
	movs r6, #0x1f
	adds r7, r0, #0
_080CB768:
	cmp r4, #0x3f
	bhi _080CB776
	cmp r4, #0x1f
	ble _080CB784
	mov r0, r8
	cmp r0, #0
	bne _080CB784
_080CB776:
	adds r0, r4, #0
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r5, r0
	bl ClearFirstPalDirectly
	b _080CB7B2
_080CB784:
	mov r0, r8
	cmp r4, #0x1f
	bgt _080CB78C
	ldr r0, [sp, #0x24]
_080CB78C:
	mov r1, sb
	cmp r1, #0
	bne _080CB7A2
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, r1
	bl CopyFirstPalDirectly
	b _080CB7B2
_080CB7A2:
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, r1
	movs r2, #0xf
	bl SetFirstPalDirectly
_080CB7B2:
	adds r4, #1
	cmp r4, r7
	blt _080CB768
_080CB7B8:
	ldr r2, [sp]
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x10
	mov r0, sl
	movs r2, #0
	bl BG_SetPosition
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

