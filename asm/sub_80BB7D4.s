	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80BB7D4, "ax", %progbits
@ sub_80BB7D4 @ JP 0x080BB7D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB7D4
	.thumb_func
sub_80BB7D4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BB7E4 @ =0x08AC0B94
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BB7E4: .4byte 0x08AC0B94

