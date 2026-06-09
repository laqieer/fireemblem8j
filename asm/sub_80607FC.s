	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80607FC, "ax", %progbits
@ sub_80607FC @ JP 0x080607FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80607FC
	.thumb_func
sub_80607FC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08060866
	ldr r0, _0806083C @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _0806084A
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060840
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0806084A
	.align 2, 0
_0806083C: .4byte 0x0203E11C
_08060840:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0806084A:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r4, #0
	bl sub_8002DE4
_08060866:
	pop {r4, r5}
	pop {r0}
	bx r0

