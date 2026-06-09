	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002EE8, 0x08002EE8 + 1
	.section .text.sub_80B95A8, "ax", %progbits
@ sub_80B95A8 @ JP 0x080B95A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B95A8
	.thumb_func
sub_80B95A8:
	push {lr}
	ldr r0, _080B95BC @ =0x08ABCAB8
	bl Proc_EndEach
	ldr r0, _080B95C0 @ =0x08A132D0
	ldr r1, _080B95C4 @ =ShowMu
	bl sub_8002EE8
	pop {r0}
	bx r0
	.align 2, 0
_080B95BC: .4byte 0x08ABCAB8
_080B95C0: .4byte 0x08A132D0
_080B95C4: .4byte 0x0807BBF1  @ ShowMu

