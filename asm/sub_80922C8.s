	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80922C8, "ax", %progbits
@ sub_80922C8 @ JP 0x080922C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80922C8
	.thumb_func
sub_80922C8:
	push {lr}
	ldr r0, _080922D8 @ =0x08A73F1C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080922D8: .4byte 0x08A73F1C

