	.syntax unified
	.set sub_8006980, 0x08006980 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800E854, 0x0800E854 + 1
	.set sub_800F338, 0x0800F338 + 1
	.set sub_808DE84, 0x0808DE84 + 1
	.set sub_8091544, 0x08091544 + 1
	.section .text.sub_800E3E0, "ax", %progbits
@ sub_800E3E0 @ JP 0x0800E3E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E3E0
	.thumb_func
sub_800E3E0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	movs r5, #0xf
	ands r5, r0
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r5, r0
	beq _0800E420
	cmp r5, #5
	beq _0800E420
	bl sub_8006980
	bl sub_8091544
	bl sub_808DE84
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E41A
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
_0800E41A:
	adds r0, r4, #0
	bl sub_800E854
_0800E420:
	adds r0, r4, #0
	adds r0, #0x42
	strb r5, [r0]
	cmp r5, #5
	bhi _0800E460
	lsls r0, r5, #2
	ldr r1, _0800E434 @ =_0800E438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E434: .4byte _0800E438
_0800E438: @ jump table
	.4byte _0800E450 @ case 0
	.4byte _0800E454 @ case 1
	.4byte _0800E454 @ case 2
	.4byte _0800E450 @ case 3
	.4byte _0800E450 @ case 4
	.4byte _0800E450 @ case 5
_0800E450:
	movs r0, #2
	b _0800E462
_0800E454:
	adds r0, r4, #0
	bl sub_800F338
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800E462
_0800E460:
	movs r0, #6
_0800E462:
	pop {r4, r5}
	pop {r1}
	bx r1

