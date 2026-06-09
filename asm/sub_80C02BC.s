	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C02BC, "ax", %progbits
@ sub_80C02BC @ JP 0x080C02BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C02BC
	.thumb_func
sub_80C02BC:
	push {lr}
	ldr r0, _080C02C8 @ =0x08AC18EC
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080C02C8: .4byte 0x08AC18EC

