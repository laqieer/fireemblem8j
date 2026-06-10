	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set ComputeChapterRankings, 0x080BB088 + 1
	.set sub_8030D50, 0x08030D50 + 1
	.set sub_8031160, 0x08031160 + 1
	.set sub_80A8D94, 0x080A8D94 + 1
	.section .text.sub_80155E0, "ax", %progbits
@ sub_80155E0 @ JP 0x080155E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80155E0
	.thumb_func
sub_80155E0:
	push {r4, r5, lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080155F4
	ldr r0, _08015620 @ =0x0202BCEC
	bl sub_80A8D94
_080155F4:
	bl ComputeChapterRankings
	ldr r0, _08015620 @ =0x0202BCEC
	adds r5, r0, #0
	adds r5, #0x4a
	ldrb r4, [r5]
	lsls r4, r4, #0x1f
	lsrs r4, r4, #0x1f
	bl sub_8031160
	movs r0, #0
	bl sub_8030D50
	cmp r4, #1
	bne _0801561A
	ldrb r0, [r5]
	movs r1, #1
	orrs r0, r1
	strb r0, [r5]
_0801561A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015620: .4byte 0x0202BCEC

