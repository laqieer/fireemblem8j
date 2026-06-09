	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B24B0, "ax", %progbits
@ sub_80B24B0 @ JP 0x080B24B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B24B0
	.thumb_func
sub_80B24B0:
	push {lr}
	ldr r0, _080B24C0 @ =0x08A9DBB4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B24C0: .4byte 0x08A9DBB4

