	.syntax unified
	.set sub_80C7934, 0x080C7934 + 1
	.set sub_80C797C, 0x080C797C + 1
	.section .text.sub_800CD34, "ax", %progbits
@ sub_800CD34 @ JP 0x0800CD34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CD34
	.thumb_func
sub_800CD34:
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldr r4, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CD5A
	adds r0, r4, #0
	bl sub_80C797C
	cmp r0, #0
	beq _0800CD56
	adds r0, r4, #0
	bl sub_80C7934
_0800CD56:
	movs r0, #0
	b _0800CD6A
_0800CD5A:
	adds r0, r4, #0
	bl sub_80C797C
	cmp r0, #0
	beq _0800CD68
	movs r0, #3
	b _0800CD6A
_0800CD68:
	movs r0, #2
_0800CD6A:
	pop {r4}
	pop {r1}
	bx r1

