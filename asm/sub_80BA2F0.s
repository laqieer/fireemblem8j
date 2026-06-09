	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80317C0, 0x080317C0 + 1
	.section .text.sub_80BA2F0, "ax", %progbits
@ sub_80BA2F0 @ JP 0x080BA2F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA2F0
	.thumb_func
sub_80BA2F0:
	push {lr}
	ldr r0, _080BA308 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_80317C0
	ldr r0, _080BA30C @ =0x08ABCAD4
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080BA308: .4byte 0x03004DF0
_080BA30C: .4byte 0x08ABCAD4

