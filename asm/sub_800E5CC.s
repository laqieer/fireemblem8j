	.syntax unified
	.set sub_8006980, 0x08006980 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800E468, 0x0800E468 + 1
	.set sub_800E4E8, 0x0800E4E8 + 1
	.set sub_800E574, 0x0800E574 + 1
	.set sub_800E854, 0x0800E854 + 1
	.set sub_8091544, 0x08091544 + 1
	.section .text.sub_800E5CC, "ax", %progbits
@ sub_800E5CC @ JP 0x0800E5CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E5CC
	.thumb_func
sub_800E5CC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	movs r0, #2
	ldrsh r3, [r1, r0]
	movs r5, #0
	cmp r2, #2
	beq _0800E5F2
	cmp r3, #0
	bge _0800E5EC
	ldr r0, _0800E600 @ =0x030004B0
	movs r1, #8
	ldrsh r3, [r0, r1]
_0800E5EC:
	cmp r3, #0
	bne _0800E5F2
	b _0800E728
_0800E5F2:
	cmp r2, #1
	beq _0800E66A
	cmp r2, #1
	bgt _0800E604
	cmp r2, #0
	beq _0800E60A
	b _0800E728
	.align 2, 0
_0800E600: .4byte 0x030004B0
_0800E604:
	cmp r2, #2
	beq _0800E6F0
	b _0800E728
_0800E60A:
	ldrh r0, [r4, #0x3c]
	ldr r1, _0800E634 @ =0x0000FFF7
	ands r1, r0
	strh r1, [r4, #0x3c]
	lsrs r1, r1, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800E61E
	b _0800E728
_0800E61E:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bls _0800E62A
	b _0800E728
_0800E62A:
	lsls r0, r0, #2
	ldr r1, _0800E638 @ =_0800E63C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E634: .4byte 0x0000FFF7
_0800E638: .4byte _0800E63C
_0800E63C: @ jump table
	.4byte _0800E654 @ case 0
	.4byte _0800E654 @ case 1
	.4byte _0800E6BE @ case 2
	.4byte _0800E662 @ case 3
	.4byte _0800E6D4 @ case 4
	.4byte _0800E6E2 @ case 5
_0800E654:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #1
	bl sub_800E468
	b _0800E728
_0800E662:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x10
	b _0800E6E8
_0800E66A:
	ldrh r0, [r4, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0800E728
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	bne _0800E728
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800E728
	lsls r0, r0, #2
	ldr r1, _0800E694 @ =_0800E698
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E694: .4byte _0800E698
_0800E698: @ jump table
	.4byte _0800E6B0 @ case 0
	.4byte _0800E6B0 @ case 1
	.4byte _0800E6BE @ case 2
	.4byte _0800E6CC @ case 3
	.4byte _0800E6D4 @ case 4
	.4byte _0800E6E2 @ case 5
_0800E6B0:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl sub_800E468
	b _0800E728
_0800E6BE:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_800E4E8
	b _0800E728
_0800E6CC:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x10
	b _0800E6E8
_0800E6D4:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_800E574
	b _0800E728
_0800E6E2:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x30
_0800E6E8:
	adds r0, r4, #0
	bl sub_800E574
	b _0800E728
_0800E6F0:
	ldrh r0, [r4, #0x3c]
	ldr r1, _0800E724 @ =0x0000FFF7
	ands r1, r0
	strh r1, [r4, #0x3c]
	bl sub_8006980
	bl sub_8091544
	bl EndAllBoxDialogue
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E718
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
_0800E718:
	adds r0, r4, #0
	bl sub_800E854
	movs r0, #2
	b _0800E72A
	.align 2, 0
_0800E724: .4byte 0x0000FFF7
_0800E728:
	movs r0, #0
_0800E72A:
	pop {r4, r5}
	pop {r1}
	bx r1

