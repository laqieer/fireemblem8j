	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_80648F8, "ax", %progbits
@ sub_80648F8 @ JP 0x080648F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80648F8
	.thumb_func
sub_80648F8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064930 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064934 @ =0x08601224
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r0, _08064938 @ =0x087554F8
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806493C @ =0x08755234
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064930: .4byte 0x0201774C
_08064934: .4byte 0x08601224
_08064938: .4byte 0x087554F8
_0806493C: .4byte 0x08755234

