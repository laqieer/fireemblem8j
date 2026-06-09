	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C5E84, "ax", %progbits
@ sub_80C5E84 @ JP 0x080C5E84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5E84
	.thumb_func
sub_80C5E84:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C5F5C
	movs r5, #0
	adds r7, r4, #0
	adds r7, #0x29
	movs r0, #0x1f
	mov r8, r0
	ldr r6, _080C5EBC @ =0x02022B68
_080C5EA4:
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C5EC0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	mov r2, r8
	ands r0, r2
	b _080C5ECE
	.align 2, 0
_080C5EBC: .4byte 0x02022B68
_080C5EC0:
	adds r1, r5, #0
	adds r1, #0x20
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	mov r1, r8
	ands r0, r1
_080C5ECE:
	lsls r0, r0, #1
	ldr r1, _080C5F2C @ =0x08B1D0DC
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6]
	ldrh r0, [r4, #0x30]
	movs r1, #0xf
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r6, #2
	adds r5, #1
	cmp r5, #0xf
	ble _080C5EA4
	ldrh r0, [r4, #0x2e]
	movs r5, #0
	strh r0, [r4, #0x2c]
	bl sub_8001EE4
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _080C5F5C
	ldrb r1, [r7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080C5F30
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080C5F5C
	.align 2, 0
_080C5F2C: .4byte 0x08B1D0DC
_080C5F30:
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080C5F40
	strh r5, [r4, #0x30]
	b _080C5F5C
_080C5F40:
	cmp r0, #0
	ble _080C5F5C
	strh r5, [r4, #0x30]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C5F5C
	ldrb r1, [r7]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7]
_080C5F5C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

