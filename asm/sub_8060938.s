	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8060938, "ax", %progbits
@ sub_8060938 @ JP 0x08060938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060938
	.thumb_func
sub_8060938:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _08060960 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060964 @ =0x085FFF70
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060960: .4byte 0x0201774C
_08060964: .4byte 0x085FFF70

