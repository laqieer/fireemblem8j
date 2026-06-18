	.syntax unified
	.set _malloc_r, 0x080D946C + 1
	.set memset, 0x080D6968 + 1
	.section .text.sub_80D8BB8, "ax", %progbits
@ __sfmoreglue @ JP 0x080D8BB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __sfmoreglue
	.thumb_func
__sfmoreglue:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x58
	adds r6, r5, #0
	muls r6, r1, r6
	adds r1, r6, #0
	adds r1, #0xc
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	beq _080D8BE4
	adds r0, #0xc
	movs r1, #0
	str r1, [r4]
	str r5, [r4, #4]
	str r0, [r4, #8]
	adds r2, r6, #0
	bl memset
	adds r0, r4, #0
	b _080D8BE6
_080D8BE4:
	movs r0, #0
_080D8BE6:
	pop {r4, r5, r6, pc}

