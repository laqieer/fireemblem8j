	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804CC58, "ax", %progbits
@ sub_804CC58 @ JP 0x0804CC58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CC58
	.thumb_func
sub_804CC58:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804CC74 @ =0x085D4890
	bl Proc_Find
	cmp r0, #0
	bne _0804CC6C
	adds r0, r4, #0
	bl sub_8002DE4
_0804CC6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC74: .4byte 0x085D4890

