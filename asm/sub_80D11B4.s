	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80D11B4, "ax", %progbits
@ sub_80D11B4 @ JP 0x080D11B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D11B4
	.thumb_func
sub_80D11B4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080D11C4 @ =0x08BAB664
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080D11C4: .4byte 0x08BAB664

