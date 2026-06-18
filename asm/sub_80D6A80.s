	.syntax unified
	.set __sfvwrite, 0x080D8F5C + 1
	.section .text.sub_80D6A80, "ax", %progbits
@ __sprint @ JP 0x080D6A80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __sprint
	.thumb_func
__sprint:
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _080D6A98
	adds r1, r4, #0
	bl __sfvwrite
	movs r1, #0
	str r1, [r4, #8]
	str r1, [r4, #4]
	b _080D6A9C
_080D6A98:
	str r1, [r4, #4]
	movs r0, #0
_080D6A9C:
	pop {r4, pc}
	.align 2, 0

