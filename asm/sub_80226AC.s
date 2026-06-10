	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80226AC, "ax", %progbits
@ sub_80226AC @ JP 0x080226AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80226AC
	.thumb_func
sub_80226AC:
	push {lr}
	ldr r0, _080226BC @ =0x08BABCB4
	movs r1, #3
	bl sub_8002BCC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080226BC: .4byte 0x08BABCB4

