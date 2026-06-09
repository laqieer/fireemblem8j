	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_8079984, 0x08079984 + 1
	.set sub_8079AFC, 0x08079AFC + 1
	.set sub_8079B60, 0x08079B60 + 1
	.set sub_8079ED0, 0x08079ED0 + 1
	.section .text.sub_8079C04, "ax", %progbits
@ sub_8079C04 @ JP 0x08079C04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079C04
	.thumb_func
sub_8079C04:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08079C30
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8079ED0
	ldr r0, _08079CB8 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
_08079C30:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x23
	bne _08079C50
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8079ED0
	ldr r0, _08079CB8 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
_08079C50:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x32
	bne _08079C70
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_8079ED0
	ldr r0, _08079CB8 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
_08079C70:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x36
	bne _08079C98
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #8
	rsbs r1, r1, #0
	ldr r2, _08079CBC @ =0x0884BEE4
	bl sub_8079AFC
	movs r0, #0
	movs r1, #0
	bl sub_8079B60
_08079C98:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	bne _08079CB0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x30]
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r0, [r4, #0x5c]
	bl sub_8079984
_08079CB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079CB8: .4byte 0x00000147
_08079CBC: .4byte 0x0884BEE4

