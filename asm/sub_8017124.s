	.syntax unified
	.set sub_803144C, 0x0803144C + 1
	.section .text.sub_8017124, "ax", %progbits
@ sub_8017124 @ JP 0x08017124 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8017124
	.thumb_func
sub_8017124:
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl sub_803144C
	adds r3, r0, #0
	movs r5, #0
	ldrh r0, [r3]
	cmp r0, #0
	beq _0801716E
	ldr r7, _08017154 @ =0x0885E068
_08017138:
	ldrh r4, [r3]
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017158
	ldrh r0, [r2, #0x1a]
	b _0801715E
	.align 2, 0
_08017154: .4byte 0x0885E068
_08017158:
	asrs r1, r4, #8
	ldrh r0, [r2, #0x1a]
	muls r0, r1, r0
_0801715E:
	adds r6, r6, r0
	adds r3, #2
	adds r5, #1
	cmp r5, #0x63
	bgt _0801716E
	ldrh r0, [r3]
	cmp r0, #0
	bne _08017138
_0801716E:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

