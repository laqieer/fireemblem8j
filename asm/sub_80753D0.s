	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80753D0, "ax", %progbits
@ sub_80753D0 @ JP 0x080753D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80753D0
	.thumb_func
sub_80753D0:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	beq _080753F6
	cmp r0, #0x52
	beq _080753F6
	cmp r0, #0x68
	beq _080753F6
	cmp r0, #0x72
	beq _080753F6
	cmp r0, #0x74
	beq _080753F6
	cmp r0, #0x76
	bne _0807540C
_080753F6:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	b _08075422
_0807540C:
	cmp r0, #0x78
	bne _08075422
	ldr r0, _08075430 @ =0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
_08075422:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075430: .4byte 0x0000013B

