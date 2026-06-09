	.syntax unified
	.set StartBgVerticalScroll, 0x08014DD0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B021C, "ax", %progbits
@ sub_80B021C @ JP 0x080B021C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B021C
	.thumb_func
sub_80B021C:
	push {lr}
	ldr r0, _080B0230 @ =0x08A9D624
	movs r1, #3
	bl sub_8002BCC
	ldr r0, _080B0234 @ =0x02000000
	bl StartBgVerticalScroll
	pop {r0}
	bx r0
	.align 2, 0
_080B0230: .4byte 0x08A9D624
_080B0234: .4byte 0x02000000

