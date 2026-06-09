	.syntax unified
	.set InitRN, 0x08000BA0 + 1
	.set InitUnits, 0x0801756C + 1
	.set nullsub_15, 0x08009F38 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801C2B8, 0x0801C2B8 + 1
	.set sub_8031160, 0x08031160 + 1
	.set sub_8031438, 0x08031438 + 1
	.set sub_80A98B4, 0x080A98B4 + 1
	.set sub_80A9A28, 0x080A9A28 + 1
	.section .text.sub_801BED8, "ax", %progbits
@ sub_801BED8 @ JP 0x0801BED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BED8
	.thumb_func
sub_801BED8:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_8000CD8
	bl InitRN
	bl InitUnits
	ldr r0, _0801BF08 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801BF0C
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl sub_80A98B4
	b _0801BF1A
	.align 2, 0
_0801BF08: .4byte 0x085775CC
_0801BF0C:
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_80A98B4
_0801BF1A:
	ldr r0, _0801BF54 @ =0x000001F1
	bl sub_8009FA8
	bl sub_8031438
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_801C2B8
	ldr r1, _0801BF58 @ =0x0202BCEC
	strb r0, [r1, #0xe]
	ldr r0, _0801BF5C @ =0x03001778
	ldrb r0, [r0]
	strb r0, [r1, #0x1b]
	movs r0, #0
	bl sub_80A9A28
	bl sub_8031160
	bl nullsub_15
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF54: .4byte 0x000001F1
_0801BF58: .4byte 0x0202BCEC
_0801BF5C: .4byte 0x03001778

