	.syntax unified
	.set GetItemAfterUse, 0x08016894 + 1
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.section .text.sub_80186A8, "ax", %progbits
@ sub_80186A8 @ JP 0x080186A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80186A8
	.thumb_func
sub_80186A8:
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0
	beq _080186C4
	bl GetItemAfterUse
	strh r0, [r4]
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_080186C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

