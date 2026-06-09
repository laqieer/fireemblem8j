	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8023B54, "ax", %progbits
@ sub_8023B54 @ JP 0x08023B54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023B54
	.thumb_func
sub_8023B54:
	push {r4, r5, lr}
	ldr r5, _08023B80 @ =0x03004DF0
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08023B84
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023B84
	movs r0, #1
	b _08023B86
	.align 2, 0
_08023B80: .4byte 0x03004DF0
_08023B84:
	movs r0, #3
_08023B86:
	pop {r4, r5}
	pop {r1}
	bx r1

