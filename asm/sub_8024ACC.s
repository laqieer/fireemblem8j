	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8024ACC, "ax", %progbits
@ sub_8024ACC @ JP 0x08024ACC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024ACC
	.thumb_func
sub_8024ACC:
	push {r4, r5, lr}
	ldr r5, _08024AF8 @ =0x03004DF0
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08024AFC
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024AFC
	movs r0, #1
	b _08024AFE
	.align 2, 0
_08024AF8: .4byte 0x03004DF0
_08024AFC:
	movs r0, #3
_08024AFE:
	pop {r4, r5}
	pop {r1}
	bx r1

