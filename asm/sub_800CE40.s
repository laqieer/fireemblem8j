	.syntax unified
	.set sub_80C7E04, 0x080C7E04 + 1
	.set sub_80C7E4C, 0x080C7E4C + 1
	.section .text.sub_800CE40, "ax", %progbits
@ EventBE_ @ JP 0x0800CE40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EventBE_
	.thumb_func
EventBE_:
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldr r4, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CE66
	adds r0, r4, #0
	bl sub_80C7E4C
	cmp r0, #0
	beq _0800CE62
	adds r0, r4, #0
	bl sub_80C7E04
_0800CE62:
	movs r0, #0
	b _0800CE76
_0800CE66:
	adds r0, r4, #0
	bl sub_80C7E4C
	cmp r0, #0
	beq _0800CE74
	movs r0, #3
	b _0800CE76
_0800CE74:
	movs r0, #2
_0800CE76:
	pop {r4}
	pop {r1}
	bx r1

