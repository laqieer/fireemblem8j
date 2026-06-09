	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80BC044, "ax", %progbits
@ sub_80BC044 @ JP 0x080BC044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BC044
	.thumb_func
sub_80BC044:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BC054 @ =0x08AC0CD0
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BC054: .4byte 0x08AC0CD0

