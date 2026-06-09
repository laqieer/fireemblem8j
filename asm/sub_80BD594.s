	.syntax unified
	.set GetWMFaceBg, 0x080BD158 + 1
	.set GetWMFaceVramOffset, 0x080BD174 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8006600, 0x08006600 + 1
	.set sub_8006620, 0x08006620 + 1
	.section .text.sub_80BD594, "ax", %progbits
@ sub_80BD594 @ JP 0x080BD594 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD594
	.thumb_func
sub_80BD594:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldr r0, _080BD5F0 @ =0x08AC10C0
	bl Proc_Find
	mov sb, r0
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #2
	adds r0, #0x2c
	mov r2, sb
	ldr r1, [r2, #0x2c]
	adds r5, r1, r0
	ldr r0, _080BD5F4 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080BD5F8
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	b _080BD616
	.align 2, 0
_080BD5F0: .4byte 0x08AC10C0
_080BD5F4: .4byte 0x03005270
_080BD5F8:
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
_080BD616:
	bl GetWMFaceBg
	adds r7, r0, #0
	bl GetWMFaceVramOffset
	adds r1, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _080BD6FC
	strh r6, [r5, #8]
	movs r0, #0xff
	ands r0, r4
	strh r0, [r5]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	strh r0, [r5, #2]
	lsrs r0, r1, #5
	adds r1, r6, #0
	bl sub_8006600
	movs r0, #4
	adds r1, r6, #0
	bl sub_8006620
	adds r0, r7, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	ldr r1, _080BD6A0 @ =0x00004482
	cmp r0, #0
	beq _080BD66C
	adds r1, #1
_080BD66C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _080BD67C
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_080BD67C:
	str r1, [sp]
	mov r0, r8
	adds r1, r6, #0
	movs r3, #0x1c
	bl sub_80063F8
	adds r2, r0, #0
	str r2, [r5, #4]
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, r1
	bne _080BD6A4
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #6
	b _080BD6CE
	.align 2, 0
_080BD6A0: .4byte 0x00004482
_080BD6A4:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _080BD6B6
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #5
	b _080BD6CE
_080BD6B6:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r4
	cmp r0, #0
	beq _080BD6C8
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #4
	b _080BD6CE
_080BD6C8:
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #3
_080BD6CE:
	strb r0, [r1]
	mov r0, r8
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #1
	strb r0, [r5, #0xa]
	mov r1, sb
	adds r1, #0x30
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _080BD6FC
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
_080BD6FC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

