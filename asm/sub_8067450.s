	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8067450, "ax", %progbits
@ sub_8067450 @ JP 0x08067450 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067450
	.thumb_func
sub_8067450:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806748C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067490 @ =0x08601A40
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #5
	str r1, [r0, #0x48]
	ldr r0, _08067494 @ =0x087A0A80
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	ldr r0, _08067498 @ =0x087A0EF4
	movs r1, #0x20
	bl sub_805679C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806748C: .4byte 0x0201774C
_08067490: .4byte 0x08601A40
_08067494: .4byte 0x087A0A80
_08067498: .4byte 0x087A0EF4

