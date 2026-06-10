	.syntax unified
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_801883C, 0x0801883C + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A09C, 0x0801A09C + 1
	.set sub_801A998, 0x0801A998 + 1
	.set sub_801B2F4, 0x0801B2F4 + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.section .text.sub_801C7D8, "ax", %progbits
@ sub_801C7D8 @ JP 0x0801C7D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C7D8
	.thumb_func
sub_801C7D8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #1
	ldr r5, _0801C840 @ =0x03004DF0
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	ldrb r2, [r0, #0x1d]
	adds r1, r1, r2
	ldr r2, _0801C844 @ =0x0203A954
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_801A09C
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C878
	ldr r0, _0801C848 @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C820
	movs r0, #1
	bl sub_801B620
_0801C820:
	ldr r0, _0801C84C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r5]
	bl sub_801883C
	cmp r0, #2
	beq _0801C860
	cmp r0, #2
	bgt _0801C850
	cmp r0, #1
	beq _0801C870
	b _0801C878
	.align 2, 0
_0801C840: .4byte 0x03004DF0
_0801C844: .4byte 0x0203A954
_0801C848: .4byte 0x0202E4EC
_0801C84C: .4byte 0x0202E4E0
_0801C850:
	cmp r0, #3
	bne _0801C878
	ldr r0, _0801C86C @ =0x0202BCAC
	adds r0, #0x3e
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	beq _0801C870
_0801C860:
	ldr r0, [r5]
	bl sub_801B2F4
	movs r4, #5
	b _0801C878
	.align 2, 0
_0801C86C: .4byte 0x0202BCAC
_0801C870:
	ldr r0, [r5]
	bl sub_801A998
	movs r4, #3
_0801C878:
	adds r0, r4, #0
	bl sub_801D6FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0

