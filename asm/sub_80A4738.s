	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80A4738, "ax", %progbits
@ sub_80A4738 @ JP 0x080A4738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4738
	.thumb_func
sub_80A4738:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _080A47CC @ =0x020229EA
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_080A4760:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _080A4786
	movs r3, #0x1f
_080A4786:
	cmp r2, #0x1f
	ble _080A478C
	movs r2, #0x1f
_080A478C:
	cmp r0, #0x1f
	ble _080A4792
	movs r0, #0x1f
_080A4792:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _080A4760
	bl sub_8001EE4
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _080A47BE
	adds r0, r6, #0
	bl sub_8002DE4
_080A47BE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A47CC: .4byte 0x020229EA

