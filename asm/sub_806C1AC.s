	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806C1AC, "ax", %progbits
@ sub_806C1AC @ JP 0x0806C1AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C1AC
	.thumb_func
sub_806C1AC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806C1DC @ =0x08602D9C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r0, _0806C1E0 @ =0x086CF8C0
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806C1E4 @ =0x086CF44C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C1DC: .4byte 0x08602D9C
_0806C1E0: .4byte 0x086CF8C0
_0806C1E4: .4byte 0x086CF44C

