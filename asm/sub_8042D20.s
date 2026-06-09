	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8042D20, "ax", %progbits
@ sub_8042D20 @ JP 0x08042D20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042D20
	.thumb_func
sub_8042D20:
	push {lr}
	ldr r0, _08042D3C @ =0x085D31EC
	bl Proc_Find
	cmp r0, #0
	bne _08042D44
	ldr r0, _08042D40 @ =0x085D320C
	bl Proc_Find
	cmp r0, #0
	bne _08042D44
	movs r0, #0
	b _08042D46
	.align 2, 0
_08042D3C: .4byte 0x085D31EC
_08042D40: .4byte 0x085D320C
_08042D44:
	movs r0, #1
_08042D46:
	pop {r1}
	bx r1
	.align 2, 0

