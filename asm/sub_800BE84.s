	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8036E4C, 0x08036E4C + 1
	.section .text.sub_800BE84, "ax", %progbits
@ sub_800BE84 @ JP 0x0800BE84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BE84
	.thumb_func
sub_800BE84:
	push {lr}
	ldr r0, _0800BE9C @ =0x085C6A48
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	bge _0800BE98
	bl sub_8036E4C
_0800BE98:
	pop {r0}
	bx r0
	.align 2, 0
_0800BE9C: .4byte 0x085C6A48

