	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set ClearFirstPalDirectly, 0x080CB70C + 1
	.set CopyFirstPalDirectly, 0x080CB6C8 + 1
	.set SetFirstPalDirectly, 0x080CB6E0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80CB7D8, "ax", %progbits
@ sub_80CB7D8 @ JP 0x080CB7D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB7D8
	.thumb_func
sub_80CB7D8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x28]
	mov sb, r4
	ldr r4, [sp, #0x2c]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sl, r4
	adds r0, r3, #0
	bl sub_8001BC0
	mov r8, r0
	cmp r5, #0
	bne _080CB810
	subs r5, #8
_080CB810:
	adds r0, r6, r7
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, r7
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	mov r0, sb
	cmp r0, #0
	beq _080CB82A
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	b _080CB830
_080CB82A:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r0, #0
_080CB830:
	subs r0, r1, r6
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	subs r1, r1, r5
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	asrs r0, r5, #3
	subs r4, r0, #1
	asrs r5, r6, #3
	lsls r6, r6, #0x10
	b _080CB86E
_080CB846:
	mov r1, sl
	cmp r1, #0
	bne _080CB85C
	movs r1, #0x1f
	ands r1, r4
	lsls r1, r1, #1
	adds r0, r0, r1
	add r1, r8
	bl CopyFirstPalDirectly
	b _080CB86C
_080CB85C:
	movs r1, #0x1f
	ands r1, r4
	lsls r1, r1, #1
	adds r0, r0, r1
	add r1, r8
	movs r2, #0xf
	bl SetFirstPalDirectly
_080CB86C:
	subs r4, #1
_080CB86E:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, #1
	cmp r4, r0
	ble _080CB8A0
	cmp r4, #0x3f
	bhi _080CB886
	cmp r4, #0x1f
	ble _080CB894
	mov r0, sb
	cmp r0, #0
	bne _080CB894
_080CB886:
	movs r0, #0x1f
	ands r0, r4
	lsls r0, r0, #1
	add r0, r8
	bl ClearFirstPalDirectly
	b _080CB86C
_080CB894:
	mov r0, sb
	cmp r4, #0x1f
	bgt _080CB89C
	ldr r0, [sp, #0x24]
_080CB89C:
	cmp r0, #0
	bne _080CB846
_080CB8A0:
	lsrs r1, r6, #0x10
	ldr r0, [sp]
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

