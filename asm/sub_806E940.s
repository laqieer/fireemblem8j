	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D6390, 0x080D6390 + 1
	.section .text.sub_806E940, "ax", %progbits
@ sub_806E940 @ JP 0x0806E940 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E940
	.thumb_func
sub_806E940:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806E968 @ =0x08603394
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, _0806E96C @ =0x085E42E8
	ldr r1, _0806E970 @ =0x06012000
	bl sub_80D6390
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E968: .4byte 0x08603394
_0806E96C: .4byte 0x085E42E8
_0806E970: .4byte 0x06012000

