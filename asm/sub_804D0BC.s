	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_804D0BC, "ax", %progbits
@ sub_804D0BC @ JP 0x0804D0BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D0BC
	.thumb_func
sub_804D0BC:
	push {r4, lr}
	ldr r4, _0804D0D8 @ =0x085D49F8
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0804D0D0
	adds r0, r4, #0
	bl Proc_EndEach
_0804D0D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D0D8: .4byte 0x085D49F8

