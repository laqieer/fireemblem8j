	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B0E88, "ax", %progbits
@ sub_80B0E88 @ JP 0x080B0E88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0E88
	.thumb_func
sub_80B0E88:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B0E98 @ =0x08A9D978
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B0E98: .4byte 0x08A9D978

