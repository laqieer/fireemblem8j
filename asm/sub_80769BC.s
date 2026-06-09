	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80769BC, "ax", %progbits
@ sub_80769BC @ JP 0x080769BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80769BC
	.thumb_func
sub_80769BC:
	push {lr}
	ldr r0, _080769D0 @ =0x087A9910
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_080769D0: .4byte 0x087A9910

