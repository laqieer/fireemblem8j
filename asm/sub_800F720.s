	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set IsSethLArachelMyrrhInnes, 0x08086B24 + 1
	.set IsUnitSlotAvailable, 0x08018C5C + 1
	.section .text.sub_800F720, "ax", %progbits
@ sub_800F720 @ JP 0x0800F720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F720
	.thumb_func
sub_800F720:
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldrb r1, [r4, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F75C
	cmp r5, #1
	beq _0800F75C
	ldrb r0, [r4]
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0800F75C
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800F75C
	cmp r5, #0
	beq _0800F79A
	cmp r5, #2
	bne _0800F75C
	ldrb r0, [r4]
	bl IsSethLArachelMyrrhInnes
	cmp r0, #0
	beq _0800F79A
_0800F75C:
	ldrb r1, [r4, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #4
	bne _0800F7A8
	ldr r0, [r4, #4]
	ldr r1, _0800F7A0 @ =0xFF004000
	ands r0, r1
	cmp r0, #0
	bne _0800F78E
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	ldr r1, _0800F7A4 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800F79A
_0800F78E:
	movs r0, #0x80
	bl IsUnitSlotAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F7A8
_0800F79A:
	movs r0, #0
	b _0800F7AA
	.align 2, 0
_0800F7A0: .4byte 0xFF004000
_0800F7A4: .4byte 0x0202E4D4
_0800F7A8:
	movs r0, #1
_0800F7AA:
	pop {r4, r5}
	pop {r1}
	bx r1

