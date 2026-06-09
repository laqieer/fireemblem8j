	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B7610, "ax", %progbits
@ sub_80B7610 @ JP 0x080B7610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7610
	.thumb_func
sub_80B7610:
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B7628 @ =0x08AAFC54
	bl Proc_StartBlocking
	adds r0, #0x33
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7628: .4byte 0x08AAFC54

