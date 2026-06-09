	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_80B0238, "ax", %progbits
@ sub_80B0238 @ JP 0x080B0238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0238
	.thumb_func
sub_80B0238:
	push {lr}
	ldr r0, _080B024C @ =0x08A9D624
	bl Proc_EndEach
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_080B024C: .4byte 0x08A9D624

