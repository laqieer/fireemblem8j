	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_801D640, "ax", %progbits
@ sub_801D640 @ JP 0x0801D640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D640
	.thumb_func
sub_801D640:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8000CD8
	lsrs r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	adds r4, #0x4a
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801D668
	lsls r0, r5, #1
	ldr r1, _0801D6B8 @ =0x08A74FEC
	adds r0, r0, r1
	movs r1, #0x82
	movs r2, #0x20
	bl sub_8000D68
_0801D668:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801D680
	lsls r0, r5, #1
	ldr r1, _0801D6BC @ =0x08A7504C
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl sub_8000D68
_0801D680:
	ldrh r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801D698
	lsls r0, r5, #1
	ldr r1, _0801D6C0 @ =0x08A750AC
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl sub_8000D68
_0801D698:
	ldrh r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801D6B0
	lsls r0, r5, #1
	ldr r1, _0801D6B8 @ =0x08A74FEC
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl sub_8000D68
_0801D6B0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D6B8: .4byte 0x08A74FEC
_0801D6BC: .4byte 0x08A7504C
_0801D6C0: .4byte 0x08A750AC

