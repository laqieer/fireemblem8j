	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_801430C, "ax", %progbits
@ sub_801430C @ JP 0x0801430C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801430C
	.thumb_func
sub_801430C:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _0801431E
	adds r0, r1, #0
	bl sub_8002DE4
	b _08014322
_0801431E:
	subs r0, #1
	str r0, [r1, #0x58]
_08014322:
	pop {r0}
	bx r0
	.align 2, 0

