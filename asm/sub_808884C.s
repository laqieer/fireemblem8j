	.syntax unified
	.set sub_800D4BC, 0x0800D4BC + 1
	.section .text.sub_808884C, "ax", %progbits
@ sub_808884C @ JP 0x0808884C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808884C
	.thumb_func
sub_808884C:
	push {lr}
	ldr r0, _08088860 @ =0x0202BCEC
	movs r1, #3
	strb r1, [r0, #0x1b]
	ldr r0, _08088864 @ =0x00000BD8
	bl sub_800D4BC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08088860: .4byte 0x0202BCEC
_08088864: .4byte 0x00000BD8

