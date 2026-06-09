	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80A2BF8, "ax", %progbits
@ sub_80A2BF8 @ JP 0x080A2BF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2BF8
	.thumb_func
sub_80A2BF8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A2C0C @ =0x08A95370
	bl Proc_StartBlocking
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C0C: .4byte 0x08A95370

