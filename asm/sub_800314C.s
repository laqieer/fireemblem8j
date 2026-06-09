	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800314C, "ax", %progbits
@ sub_800314C @ JP 0x0800314C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800314C
	.thumb_func
sub_800314C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _0800316A
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	b _0800316C
_0800316A:
	movs r0, #0
_0800316C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

