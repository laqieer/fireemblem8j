	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.set IsUnitMagicSealed, 0x08018A1C + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8023A18, "ax", %progbits
@ sub_8023A18 @ JP 0x08023A18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023A18
	.thumb_func
sub_8023A18:
	push {r4, r5, r6, lr}
	ldr r0, _08023A2C @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023A34
	b _08023A82
	.align 2, 0
_08023A2C: .4byte 0x03004DF0
_08023A30:
	movs r0, #2
	b _08023A84
_08023A34:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _08023A82
_08023A3C:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08023A6C
	ldr r5, _08023A68 @ =0x03004DF0
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023A6C
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023A30
	movs r0, #1
	b _08023A84
	.align 2, 0
_08023A68: .4byte 0x03004DF0
_08023A6C:
	adds r6, #1
	cmp r6, #4
	bgt _08023A82
	ldr r0, _08023A8C @ =0x03004DF0
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08023A3C
_08023A82:
	movs r0, #3
_08023A84:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023A8C: .4byte 0x03004DF0

