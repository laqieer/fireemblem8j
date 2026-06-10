	.syntax unified
	.set SetTalkFlag, 0x080069AC + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_8006934, 0x08006934 + 1
	.section .text.sub_800E468, "ax", %progbits
@ sub_800E468 @ JP 0x0800E468 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E468
	.thumb_func
sub_800E468:
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #1
	bne _0800E482
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_8006710
_0800E482:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #1
	bne _0800E4B0
	ldr r2, _0800E4AC @ =0x0202BCEC
	adds r2, #0x40
	ldrb r3, [r2]
	lsls r0, r3, #0x19
	lsrs r0, r0, #0x1e
	adds r1, r4, #0
	adds r1, #0x40
	strb r0, [r1]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r3
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	b _0800E4B8
	.align 2, 0
_0800E4AC: .4byte 0x0202BCEC
_0800E4B0:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
_0800E4B8:
	movs r0, #1
	movs r1, #1
	adds r2, r5, #0
	bl sub_8006934
	ldrh r1, [r4, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800E4D2
	movs r0, #4
	bl SetTalkFlag
_0800E4D2:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E4E2
	movs r0, #8
	bl SetTalkFlag
_0800E4E2:
	pop {r4, r5}
	pop {r0}
	bx r0

