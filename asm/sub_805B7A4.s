	.syntax unified
	.set InitMainMiniAnim, 0x0805B3B0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.NewEkrUnitMainMini, "ax", %progbits
@ NewEkrUnitMainMini @ JP 0x0805B7A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEkrUnitMainMini
	.thumb_func
NewEkrUnitMainMini:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0805B7C8 @ =0x085E3FF4
	movs r1, #4
	bl sub_8002BCC
	adds r5, r0, #0
	adds r0, r4, #0
	bl InitMainMiniAnim
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B7C8: .4byte 0x085E3FF4

