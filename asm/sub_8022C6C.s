	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025164, 0x08025164 + 1
	.section .text.sub_8022C6C, "ax", %progbits
@ sub_8022C6C @ JP 0x08022C6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022C6C
	.thumb_func
sub_8022C6C:
	push {r4, r5, lr}
	ldr r5, _08022CAC @ =0x03004DF0
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022CB0
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022CB0
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_8025164
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08022CB0
	movs r0, #1
	b _08022CB2
	.align 2, 0
_08022CAC: .4byte 0x03004DF0
_08022CB0:
	movs r0, #3
_08022CB2:
	pop {r4, r5}
	pop {r1}
	bx r1

