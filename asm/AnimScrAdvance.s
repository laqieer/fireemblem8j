	.syntax unified
	.set sub_805AF74, 0x0805AF74 + 1
	.section .text.AnimScrAdvance, "ax", %progbits
@ AnimScrAdvance @ JP 0x0805A670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AnimScrAdvance
	.thumb_func
AnimScrAdvance:
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x12]
	bl sub_805AF74
	cmp r0, #0
	beq _0805A6AA
	ldr r1, [r4, #0x20]
	ldr r0, _0805A68C @ =0x085E3F8C
	cmp r1, r0
	beq _0805A6AA
	movs r2, #0x3f
	b _0805A698
	.align 2, 0
_0805A68C: .4byte 0x085E3F8C
_0805A690:
	cmp r1, #6
	bne _0805A698
	adds r0, #0xc
	str r0, [r4, #0x20]
_0805A698:
	ldr r0, [r4, #0x20]
	ldrb r1, [r0, #3]
	ands r1, r2
	cmp r1, #0
	beq _0805A6A6
	cmp r1, #5
	bne _0805A690
_0805A6A6:
	subs r0, #0xc
	str r0, [r4, #0x20]
_0805A6AA:
	pop {r4}
	pop {r0}
	bx r0

