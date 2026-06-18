	.syntax unified
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set SetSomeRealCamPos, 0x0800BD4C + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8015D90, 0x08015D90 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_8019914, 0x08019914 + 1
	.section .text.sub_800F41C, "ax", %progbits
@ Event26_CameraControl @ JP 0x0800F41C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event26_CameraControl
	.thumb_func
Event26_CameraControl:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r2, [r6, #0x38]
	ldrh r1, [r2]
	movs r3, #7
	ands r3, r1
	movs r0, #0xf
	ands r0, r1
	lsrs r7, r0, #3
	cmp r3, #0
	beq _0800F438
	cmp r3, #1
	beq _0800F45C
	b _0800F474
_0800F438:
	ldrh r0, [r2, #2]
	movs r5, #2
	ldrsb r5, [r2, r5]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x18
	cmp r5, #0
	blt _0800F44A
	cmp r4, #0
	bge _0800F474
_0800F44A:
	ldr r0, _0800F458 @ =0x030004DC
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r4, #2
	ldrsb r4, [r0, r4]
	b _0800F474
	.align 2, 0
_0800F458: .4byte 0x030004DC
_0800F45C:
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl sub_800BF3C
	cmp r0, #0
	bne _0800F46C
	movs r0, #6
	b _0800F4C8
_0800F46C:
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
_0800F474:
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800F48A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800F4A4
_0800F48A:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl SetSomeRealCamPos
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetCursorMapPosition
	bl sub_8019914
	movs r0, #0
	b _0800F4C8
_0800F4A4:
	cmp r7, #0
	bne _0800F4B4
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8015E18
	b _0800F4BE
_0800F4B4:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8015D90
_0800F4BE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetCursorMapPosition
	movs r0, #2
_0800F4C8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

