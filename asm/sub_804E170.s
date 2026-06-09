	.syntax unified
	.set StartBgm, 0x08002424 + 1
	.section .text.sub_804E170, "ax", %progbits
@ sub_804E170 @ JP 0x0804E170 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E170
	.thumb_func
sub_804E170:
	push {lr}
	ldr r1, _0804E180 @ =0x03006640
	movs r0, #0x34
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
_0804E180: .4byte 0x03006640

