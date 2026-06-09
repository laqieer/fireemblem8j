	.syntax unified
	.set ArenaIsUnitAllowed, 0x08031E9C + 1
	.set CountUnitUsableWeapons, 0x0809A0E0 + 1
	.section .text.sub_809A110, "ax", %progbits
@ sub_809A110 @ JP 0x0809A110 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A110
	.thumb_func
sub_809A110:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0809A142
	adds r0, r4, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A142
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #0
	beq _0809A142
	movs r0, #1
	b _0809A144
_0809A142:
	movs r0, #0
_0809A144:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

