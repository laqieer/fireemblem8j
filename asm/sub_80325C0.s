	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set UnitDrop, 0x08018084 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80181F4, 0x080181F4 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.section .text.sub_80325C0, "ax", %progbits
@ sub_80325C0 @ JP 0x080325C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80325C0
	.thumb_func
sub_80325C0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl sub_8018E64
	adds r6, r0, #0
	cmp r6, #0
	bne _08032662
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08032662
	ldr r0, _08032668 @ =0x085C5F74
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, r5, #0
	bl sub_80181F4
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r0, r5, #0
	bl UnitDrop
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, _0803266C @ =0x0000FFFB
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r1, #4
	movs r0, #0xb
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_80176AC
	bl sub_80267A0
	bl sub_8026F38
	ldr r0, _08032670 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08032662
	movs r0, #0xac
	bl m4aSongNumStart
_08032662:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032668: .4byte 0x085C5F74
_0803266C: .4byte 0x0000FFFB
_08032670: .4byte 0x0202BCEC

