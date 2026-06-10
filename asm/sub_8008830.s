	.syntax unified
	.set sub_8050B14, 0x08050B14 + 1
	.section .text.sub_8008830, "ax", %progbits
@ sub_8008830 @ JP 0x08008830 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008830
	.thumb_func
sub_8008830:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8050B14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800884A
	cmp r4, #2
	bgt _08008846
	movs r0, #4
	b _08008852
_08008846:
	movs r0, #0x1a
	b _08008852
_0800884A:
	ldr r0, _08008858 @ =0x085B9308
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08008852:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008858: .4byte 0x085B9308

