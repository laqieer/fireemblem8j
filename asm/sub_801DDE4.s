	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_801915C, 0x0801915C + 1
	.section .text.sub_801DDE4, "ax", %progbits
@ sub_801DDE4 @ JP 0x0801DDE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DDE4
	.thumb_func
sub_801DDE4:
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _0801DE2C @ =0x03004DF0
	ldr r1, [r5]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl AddItemToConvoy
	ldr r3, _0801DE30 @ =0x0203A954
	ldr r0, [r5]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r3, #6]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_801915C
	ldr r0, [r5]
	ldr r1, _0801DE34 @ =0x0202BCAC
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
	movs r0, #0x37
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DE2C: .4byte 0x03004DF0
_0801DE30: .4byte 0x0203A954
_0801DE34: .4byte 0x0202BCAC

