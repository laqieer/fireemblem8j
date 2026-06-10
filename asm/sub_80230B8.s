	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025B10, 0x08025B10 + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_80230B8, "ax", %progbits
@ sub_80230B8 @ JP 0x080230B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80230B8
	.thumb_func
sub_80230B8:
	push {r4, r5, r6, lr}
	ldr r6, _080230DC @ =0x03004DF0
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023116
	adds r0, r2, #0
	bl sub_8025B10
	bl GetSelectTargetCount
	cmp r0, #0
	beq _080230E0
_080230D6:
	movs r0, #1
	b _08023118
	.align 2, 0
_080230DC: .4byte 0x03004DF0
_080230E0:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _08023116
_080230EA:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08023102
	ldr r0, [r6]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080230D6
_08023102:
	adds r5, #1
	cmp r5, #4
	bgt _08023116
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080230EA
_08023116:
	movs r0, #3
_08023118:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

