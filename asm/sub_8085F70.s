	.syntax unified
	.section .text.sub_8085F70, "ax", %progbits
@ sub_8085F70 @ JP 0x08085F70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085F70
	.thumb_func
sub_8085F70:
	push {lr}
	ldr r1, _08085F84 @ =0x03005260
	movs r2, #0
	adds r0, r1, #4
_08085F78:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08085F78
	pop {r0}
	bx r0
	.align 2, 0
_08085F84: .4byte 0x03005260

