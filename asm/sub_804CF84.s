	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804CF84, "ax", %progbits
@ sub_804CF84 @ JP 0x0804CF84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CF84
	.thumb_func
sub_804CF84:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804CFA4 @ =0x085D4910
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _0804CF9C
	adds r0, r4, #0
	bl sub_8002DE4
_0804CF9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CFA4: .4byte 0x085D4910

