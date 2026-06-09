	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80BFFD0, "ax", %progbits
@ sub_80BFFD0 @ JP 0x080BFFD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFFD0
	.thumb_func
sub_80BFFD0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r4, #0x34
	adds r6, r4, #0
	movs r7, #0
	movs r5, #6
_080BFFDC:
	cmp r6, #0
	beq _080BFFE8
	ldr r0, [r4]
	bl Proc_End
	str r7, [r4]
_080BFFE8:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080BFFDC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

