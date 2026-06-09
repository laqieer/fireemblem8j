	.syntax unified
	.set nullsub_13, 0x08008F28 + 1
	.section .text.sub_8048310, "ax", %progbits
@ sub_8048310 @ JP 0x08048310 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048310
	.thumb_func
sub_8048310:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804832C @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls _08048326
	adds r0, r1, #0
	movs r1, #0
	bl nullsub_13
_08048326:
	pop {r0}
	bx r0
	.align 2, 0
_0804832C: .4byte 0x085D31E8

