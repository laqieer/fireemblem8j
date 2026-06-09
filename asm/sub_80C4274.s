	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C4274, "ax", %progbits
@ sub_80C4274 @ JP 0x080C4274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4274
	.thumb_func
sub_80C4274:
	push {lr}
	ldr r0, _080C4288 @ =0x08AC1108
	bl Proc_Find
	ldr r1, [r0, #0x30]
	movs r0, #1
	bics r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080C4288: .4byte 0x08AC1108

